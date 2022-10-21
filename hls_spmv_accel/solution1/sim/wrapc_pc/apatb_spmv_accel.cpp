#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;

// wrapc file define:
#define AUTOTB_TVIN_values "../tv/cdatafile/c.spmv_accel.autotvin_values.dat"
#define AUTOTB_TVOUT_values "../tv/cdatafile/c.spmv_accel.autotvout_values.dat"
#define AUTOTB_TVIN_cols "../tv/cdatafile/c.spmv_accel.autotvin_cols.dat"
#define AUTOTB_TVOUT_cols "../tv/cdatafile/c.spmv_accel.autotvout_cols.dat"
#define AUTOTB_TVIN_rows "../tv/cdatafile/c.spmv_accel.autotvin_rows.dat"
#define AUTOTB_TVOUT_rows "../tv/cdatafile/c.spmv_accel.autotvout_rows.dat"
#define AUTOTB_TVIN_x "../tv/cdatafile/c.spmv_accel.autotvin_x.dat"
#define AUTOTB_TVOUT_x "../tv/cdatafile/c.spmv_accel.autotvout_x.dat"
#define AUTOTB_TVIN_y "../tv/cdatafile/c.spmv_accel.autotvin_y.dat"
#define AUTOTB_TVOUT_y "../tv/cdatafile/c.spmv_accel.autotvout_y.dat"
#define AUTOTB_TVIN_row_size "../tv/cdatafile/c.spmv_accel.autotvin_row_size.dat"
#define AUTOTB_TVOUT_row_size "../tv/cdatafile/c.spmv_accel.autotvout_row_size.dat"
#define AUTOTB_TVIN_col_size "../tv/cdatafile/c.spmv_accel.autotvin_col_size.dat"
#define AUTOTB_TVOUT_col_size "../tv/cdatafile/c.spmv_accel.autotvout_col_size.dat"
#define AUTOTB_TVIN_data_size "../tv/cdatafile/c.spmv_accel.autotvin_data_size.dat"
#define AUTOTB_TVOUT_data_size "../tv/cdatafile/c.spmv_accel.autotvout_data_size.dat"
#define AUTOTB_TVOUT_return "../tv/cdatafile/c.spmv_accel.autotvout_ap_return.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_values "../tv/rtldatafile/rtl.spmv_accel.autotvout_values.dat"
#define AUTOTB_TVOUT_PC_cols "../tv/rtldatafile/rtl.spmv_accel.autotvout_cols.dat"
#define AUTOTB_TVOUT_PC_rows "../tv/rtldatafile/rtl.spmv_accel.autotvout_rows.dat"
#define AUTOTB_TVOUT_PC_x "../tv/rtldatafile/rtl.spmv_accel.autotvout_x.dat"
#define AUTOTB_TVOUT_PC_y "../tv/rtldatafile/rtl.spmv_accel.autotvout_y.dat"
#define AUTOTB_TVOUT_PC_row_size "../tv/rtldatafile/rtl.spmv_accel.autotvout_row_size.dat"
#define AUTOTB_TVOUT_PC_col_size "../tv/rtldatafile/rtl.spmv_accel.autotvout_col_size.dat"
#define AUTOTB_TVOUT_PC_data_size "../tv/rtldatafile/rtl.spmv_accel.autotvout_data_size.dat"
#define AUTOTB_TVOUT_PC_return "../tv/rtldatafile/rtl.spmv_accel.autotvout_ap_return.dat"


static const bool little_endian()
{
  int a = 1;
  return *(char*)&a == 1;
}

inline static void rev_endian(char* p, size_t nbytes)
{
  std::reverse(p, p+nbytes);
}

template<size_t bit_width>
struct transaction {
  typedef uint64_t depth_t;
  static const size_t wbytes = (bit_width+7)>>3;
  static const size_t dbytes = sizeof(depth_t);
  const depth_t depth;
  const size_t vbytes;
  const size_t tbytes;
  char * const p;
  typedef char (*p_dat)[wbytes];
  p_dat vp;

  transaction(depth_t depth)
    : depth(depth), vbytes(wbytes*depth), tbytes(dbytes+vbytes),
      p(new char[tbytes]) {
    *(depth_t*)p = depth;
    rev_endian(p, dbytes);
    vp = (p_dat) (p+dbytes);
  }

  void reorder() {
    rev_endian(p, dbytes);
    p_dat vp = (p_dat) (p+dbytes);
    for (depth_t i = 0; i < depth; ++i) {
      rev_endian(vp[i], wbytes);
    }
  }

  template<size_t psize>
  void import(char* param, depth_t num, int64_t offset) {
    param -= offset*psize;
    for (depth_t i = 0; i < num; ++i) {
      memcpy(vp[i], param, wbytes);
      param += psize;
      if (little_endian()) {
        rev_endian(vp[i], wbytes);
      }
    }
    vp += num;
  }

  template<size_t psize>
  void send(char* param, depth_t num) {
    for (depth_t i = 0; i < num; ++i) {
      memcpy(param, vp[i], wbytes);
      param += psize;
    }
    vp += num;
  }

  template<size_t psize>
  void send(char* param, depth_t num, int64_t skip) {
    for (depth_t i = 0; i < num; ++i) {
      memcpy(param, vp[skip+i], wbytes);
      param += psize;
    }
  }

  ~transaction() { if (p) { delete[] p; } }
};


inline static const std::string begin_str(int num)
{
  return std::string("[[transaction]]           ")
         .append(std::to_string(num))
         .append("\n");
}

inline static const std::string end_str()
{
  return std::string("[[/transaction]]\n");
}

const std::string formatData(unsigned char *pos, size_t wbits)
{
  bool LE = little_endian();
  size_t wbytes = (wbits+7)>>3;
  size_t i = LE ? wbytes-1 : 0;
  auto next = [&] () {
    auto c = pos[i];
    LE ? --i : ++i;
    return c;
  };
  std::ostringstream ss;
  ss << "0x";
  if (int t = (wbits & 0x7)) {
    if (t <= 4) {
      unsigned char mask = (1<<t)-1;
      ss << std::hex << std::setfill('0') << std::setw(1)
         << (int) (next() & mask);
      wbytes -= 1;
    }
  }
  for (size_t i = 0; i < wbytes; ++i) {
    ss << std::hex << std::setfill('0') << std::setw(2) << (int)next();
  }
  ss.put('\n');
  return ss.str();
}

static bool RTLOutputCheckAndReplacement(std::string &data)
{
  bool changed = false;
  for (size_t i = 2; i < data.size(); ++i) {
    if (data[i] == 'X' || data[i] == 'x') {
      data[i] = '0';
      changed = true;
    }
  }
  return changed;
}

struct SimException : public std::exception {
  const char *msg;
  const size_t line;
  SimException(const char *msg, const size_t line)
    : msg(msg), line(line)
  {
  }
};

template<size_t bit_width>
class PostCheck
{
  static const char *bad;
  static const char *err;
  std::fstream stream;
  std::string s;

  void send(char *p, ap_uint<bit_width> &data, size_t l, size_t rest)
  {
    if (rest == 0) {
      if (!little_endian()) {
        const size_t wbytes = (bit_width+7)>>3;
        rev_endian(p-wbytes, wbytes);
      }
    } else if (rest < 8) {
      *p = data.range(l+rest-1, l).to_uint();
      send(p+1, data, l+rest, 0);
    } else {
      *p = data.range(l+8-1, l).to_uint();
      send(p+1, data, l+8, rest-8);
    }
  }

  void readline()
  {
    std::getline(stream, s);
    if (stream.eof()) {
      throw SimException(bad, __LINE__);
    }
  }

public:
  char *param;
  size_t psize;
  size_t depth;

  PostCheck(const char *file)
  {
    stream.open(file);
    if (stream.fail()) {
      throw SimException(err, __LINE__);
    } else {
      readline();
      if (s != "[[[runtime]]]") {
        throw SimException(bad, __LINE__);
      }
    }
  }

  ~PostCheck() noexcept(false)
  {
    stream.close();
  }

  void run(size_t AESL_transaction_pc, size_t skip)
  {
    if (stream.peek() == '[') {
      readline();
    }

    for (size_t i = 0; i < skip; ++i) {
      readline();
    }

    bool foundX = false;
    for (size_t i = 0; i < depth; ++i) {
      readline();
      foundX |= RTLOutputCheckAndReplacement(s);
      ap_uint<bit_width> data(s.c_str(), 16);
      send(param+i*psize, data, 0, bit_width);
    }
    if (foundX) {
      std::cerr << "WARNING: [SIM 212-201] RTL produces unknown value "
                << "'x' or 'X' on some port, possible cause: "
                << "There are uninitialized variables in the design.\n";
    }

    if (stream.peek() == '[') {
      readline();
    }
  }
};

template<size_t bit_width>
const char* PostCheck<bit_width>::bad = "Bad TV file";

template<size_t bit_width>
const char* PostCheck<bit_width>::err = "Error on TV file";
      
class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  values_depth = 0;
  cols_depth = 0;
  rows_depth = 0;
  x_depth = 0;
  y_depth = 0;
  row_size_depth = 0;
  col_size_depth = 0;
  data_size_depth = 0;
  return_depth = 0;
  trans_num =0;
}
~INTER_TCL_FILE() {
  mFile.open(mName);
  if (!mFile.good()) {
    cout << "Failed to open file ref.tcl" << endl;
    exit (1); 
  }
  string total_list = get_depth_list();
  mFile << "set depth_list {\n";
  mFile << total_list;
  mFile << "}\n";
  mFile << "set trans_num "<<trans_num<<endl;
  mFile.close();
}
string get_depth_list () {
  stringstream total_list;
  total_list << "{values " << values_depth << "}\n";
  total_list << "{cols " << cols_depth << "}\n";
  total_list << "{rows " << rows_depth << "}\n";
  total_list << "{x " << x_depth << "}\n";
  total_list << "{y " << y_depth << "}\n";
  total_list << "{row_size " << row_size_depth << "}\n";
  total_list << "{col_size " << col_size_depth << "}\n";
  total_list << "{data_size " << data_size_depth << "}\n";
  total_list << "{ap_return " << return_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int values_depth;
    int cols_depth;
    int rows_depth;
    int x_depth;
    int y_depth;
    int row_size_depth;
    int col_size_depth;
    int data_size_depth;
    int return_depth;
    int trans_num;
  private:
    ofstream mFile;
    const char* mName;
};


extern "C" int spmv_accel_hw_stub_wrapper(volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, int, int, int);

extern "C" int apatb_spmv_accel_hw(volatile void * __xlx_apatb_param_values, volatile void * __xlx_apatb_param_cols, volatile void * __xlx_apatb_param_rows, volatile void * __xlx_apatb_param_x, volatile void * __xlx_apatb_param_y, int __xlx_apatb_param_row_size, int __xlx_apatb_param_col_size, int __xlx_apatb_param_data_size) {
  refine_signal_handler();
  fstream wrapc_switch_file_token;
  wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
static AESL_FILE_HANDLER aesl_fh;
  int AESL_i;
  if (wrapc_switch_file_token.good())
  {

    CodeState = ENTER_WRAPC_PC;
    static unsigned AESL_transaction_pc = 0;
    string AESL_token;
    string AESL_num;

    int AESL_return;
    {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_return);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > return_pc_buffer(1);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              return_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "return" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {((char*)&AESL_return)[0*4+0] = return_pc_buffer[0].range(7, 0).to_int64();
((char*)&AESL_return)[0*4+1] = return_pc_buffer[0].range(15, 8).to_int64();
((char*)&AESL_return)[0*4+2] = return_pc_buffer[0].range(23, 16).to_int64();
((char*)&AESL_return)[0*4+3] = return_pc_buffer[0].range(31, 24).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  #ifdef USE_BINARY_TV_FILE
{
transaction<32> tr(4);
aesl_fh.read(AUTOTB_TVOUT_PC_y, tr.p, tr.tbytes);
if (little_endian()) { tr.reorder(); }
tr.send<4>((char*)__xlx_apatb_param_y, 4);
}
#else
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_y);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > y_pc_buffer(4);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              y_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "y" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 4; j < e; j += 1, ++i) {((char*)__xlx_apatb_param_y)[j*4+0] = y_pc_buffer[i].range(7, 0).to_int64();
((char*)__xlx_apatb_param_y)[j*4+1] = y_pc_buffer[i].range(15, 8).to_int64();
((char*)__xlx_apatb_param_y)[j*4+2] = y_pc_buffer[i].range(23, 16).to_int64();
((char*)__xlx_apatb_param_y)[j*4+3] = y_pc_buffer[i].range(31, 24).to_int64();
}}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  #endif

    AESL_transaction_pc++;
    return  AESL_return;
  }
static unsigned AESL_transaction;
static INTER_TCL_FILE tcl_file(INTER_TCL);
std::vector<char> __xlx_sprintf_buffer(1024);
CodeState = ENTER_WRAPC;
CodeState = DUMP_INPUTS;
unsigned __xlx_offset_byte_param_values = 0;
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVIN_values, 'b');
transaction<32> tr(9);
  __xlx_offset_byte_param_values = 0*4;
  if (__xlx_apatb_param_values) {
tr.import<4>((char*)__xlx_apatb_param_values, 9, 0);
  }
aesl_fh.write(AUTOTB_TVIN_values, tr.p, tr.tbytes);
}

  tcl_file.set_num(9, &tcl_file.values_depth);
#else
// print values Transactions
{
aesl_fh.write(AUTOTB_TVIN_values, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_values = 0*4;
if (__xlx_apatb_param_values) {
for (size_t i = 0; i < 9; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_values + i * 4;
std::string s = formatData(pos, 32);
aesl_fh.write(AUTOTB_TVIN_values, s);
}
}
}

  tcl_file.set_num(9, &tcl_file.values_depth);
aesl_fh.write(AUTOTB_TVIN_values, end_str());
}

#endif
unsigned __xlx_offset_byte_param_cols = 0;
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVIN_cols, 'b');
transaction<32> tr(9);
  __xlx_offset_byte_param_cols = 0*4;
  if (__xlx_apatb_param_cols) {
tr.import<4>((char*)__xlx_apatb_param_cols, 9, 0);
  }
aesl_fh.write(AUTOTB_TVIN_cols, tr.p, tr.tbytes);
}

  tcl_file.set_num(9, &tcl_file.cols_depth);
#else
// print cols Transactions
{
aesl_fh.write(AUTOTB_TVIN_cols, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_cols = 0*4;
if (__xlx_apatb_param_cols) {
for (size_t i = 0; i < 9; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_cols + i * 4;
std::string s = formatData(pos, 32);
aesl_fh.write(AUTOTB_TVIN_cols, s);
}
}
}

  tcl_file.set_num(9, &tcl_file.cols_depth);
aesl_fh.write(AUTOTB_TVIN_cols, end_str());
}

#endif
unsigned __xlx_offset_byte_param_rows = 0;
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVIN_rows, 'b');
transaction<32> tr(4);
  __xlx_offset_byte_param_rows = 0*4;
  if (__xlx_apatb_param_rows) {
tr.import<4>((char*)__xlx_apatb_param_rows, 4, 0);
  }
aesl_fh.write(AUTOTB_TVIN_rows, tr.p, tr.tbytes);
}

  tcl_file.set_num(4, &tcl_file.rows_depth);
#else
// print rows Transactions
{
aesl_fh.write(AUTOTB_TVIN_rows, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_rows = 0*4;
if (__xlx_apatb_param_rows) {
for (size_t i = 0; i < 4; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_rows + i * 4;
std::string s = formatData(pos, 32);
aesl_fh.write(AUTOTB_TVIN_rows, s);
}
}
}

  tcl_file.set_num(4, &tcl_file.rows_depth);
aesl_fh.write(AUTOTB_TVIN_rows, end_str());
}

#endif
unsigned __xlx_offset_byte_param_x = 0;
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVIN_x, 'b');
transaction<32> tr(4);
  __xlx_offset_byte_param_x = 0*4;
  if (__xlx_apatb_param_x) {
tr.import<4>((char*)__xlx_apatb_param_x, 4, 0);
  }
aesl_fh.write(AUTOTB_TVIN_x, tr.p, tr.tbytes);
}

  tcl_file.set_num(4, &tcl_file.x_depth);
#else
// print x Transactions
{
aesl_fh.write(AUTOTB_TVIN_x, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_x = 0*4;
if (__xlx_apatb_param_x) {
for (size_t i = 0; i < 4; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_x + i * 4;
std::string s = formatData(pos, 32);
aesl_fh.write(AUTOTB_TVIN_x, s);
}
}
}

  tcl_file.set_num(4, &tcl_file.x_depth);
aesl_fh.write(AUTOTB_TVIN_x, end_str());
}

#endif
unsigned __xlx_offset_byte_param_y = 0;
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVIN_y, 'b');
transaction<32> tr(4);
  __xlx_offset_byte_param_y = 0*4;
  if (__xlx_apatb_param_y) {
tr.import<4>((char*)__xlx_apatb_param_y, 4, 0);
  }
aesl_fh.write(AUTOTB_TVIN_y, tr.p, tr.tbytes);
}

  tcl_file.set_num(4, &tcl_file.y_depth);
#else
// print y Transactions
{
aesl_fh.write(AUTOTB_TVIN_y, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_y = 0*4;
if (__xlx_apatb_param_y) {
for (size_t i = 0; i < 4; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_y + i * 4;
std::string s = formatData(pos, 32);
aesl_fh.write(AUTOTB_TVIN_y, s);
}
}
}

  tcl_file.set_num(4, &tcl_file.y_depth);
aesl_fh.write(AUTOTB_TVIN_y, end_str());
}

#endif
// print row_size Transactions
{
aesl_fh.write(AUTOTB_TVIN_row_size, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)&__xlx_apatb_param_row_size;
aesl_fh.write(AUTOTB_TVIN_row_size, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.row_size_depth);
aesl_fh.write(AUTOTB_TVIN_row_size, end_str());
}

// print col_size Transactions
{
aesl_fh.write(AUTOTB_TVIN_col_size, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)&__xlx_apatb_param_col_size;
aesl_fh.write(AUTOTB_TVIN_col_size, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.col_size_depth);
aesl_fh.write(AUTOTB_TVIN_col_size, end_str());
}

// print data_size Transactions
{
aesl_fh.write(AUTOTB_TVIN_data_size, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)&__xlx_apatb_param_data_size;
aesl_fh.write(AUTOTB_TVIN_data_size, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.data_size_depth);
aesl_fh.write(AUTOTB_TVIN_data_size, end_str());
}

CodeState = CALL_C_DUT;
int ap_return = spmv_accel_hw_stub_wrapper(__xlx_apatb_param_values, __xlx_apatb_param_cols, __xlx_apatb_param_rows, __xlx_apatb_param_x, __xlx_apatb_param_y, __xlx_apatb_param_row_size, __xlx_apatb_param_col_size, __xlx_apatb_param_data_size);
CodeState = DUMP_OUTPUTS;
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVOUT_y, 'b');
transaction<32> tr(4);
  __xlx_offset_byte_param_y = 0*4;
  if (__xlx_apatb_param_y) {
tr.import<4>((char*)__xlx_apatb_param_y, 4, 0);
  }
aesl_fh.write(AUTOTB_TVOUT_y, tr.p, tr.tbytes);
}

  tcl_file.set_num(4, &tcl_file.y_depth);
#else
// print y Transactions
{
aesl_fh.write(AUTOTB_TVOUT_y, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_y = 0*4;
if (__xlx_apatb_param_y) {
for (size_t i = 0; i < 4; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_y + i * 4;
std::string s = formatData(pos, 32);
aesl_fh.write(AUTOTB_TVOUT_y, s);
}
}
}

  tcl_file.set_num(4, &tcl_file.y_depth);
aesl_fh.write(AUTOTB_TVOUT_y, end_str());
}

#endif
// print return Transactions
{
aesl_fh.write(AUTOTB_TVOUT_return, begin_str(AESL_transaction));
auto *pos = (unsigned char*)&ap_return;
aesl_fh.write(AUTOTB_TVOUT_return, formatData(pos, 32));

  tcl_file.set_num(1, &tcl_file.return_depth);
aesl_fh.write(AUTOTB_TVOUT_return, end_str());
}

CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
return ap_return;
}
