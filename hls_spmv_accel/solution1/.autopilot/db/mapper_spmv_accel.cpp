#include <systemc>
#include <list>
#include <map>
#include <vector>
#include <iostream>
#include "hls_stream.h"
#include "ap_int.h"
#include "ap_fixed.h"
using namespace std;
using namespace sc_dt;

namespace bcsim
{
  struct Buffer {
    char *first;
    Buffer(char *addr) : first(addr)
    {
    }
  };

  struct DBuffer : public Buffer {
    size_t ufree;

    DBuffer(size_t usize) : Buffer(nullptr), ufree(1<<10)
    {
      first = new char[usize*ufree];
    }

    ~DBuffer()
    {
      delete[] first;
    }
  };

  struct CStream {
    char *front;
    char *back;
    size_t num;
    size_t usize;
    std::list<Buffer*> bufs;
    bool dynamic;

    CStream() : front(nullptr), back(nullptr),
                num(0), usize(0), dynamic(true)
    {
    }

    ~CStream()
    {
      for (Buffer *p : bufs) {
        delete p;
      }
    }

    template<typename T>
    T* data()
    {
      return (T*)front;
    }

    template<typename T>
    void transfer(hls::stream<T> *param)
    {
      while (!empty()) {
        param->write(*(T*)nextRead());
      }
    }

    bool empty();
    char* nextRead();
    char* nextWrite();
  };

  bool CStream::empty()
  {
    return num == 0;
  }

  char* CStream::nextRead()
  {
    assert(num > 0);
    char *res = front;
    front += usize;
    --num;
    return res;
  }

  char* CStream::nextWrite()
  {
    if (dynamic) {
      if (static_cast<DBuffer*>(bufs.back())->ufree == 0) {
        bufs.push_back(new DBuffer(usize));
        back = bufs.back()->first;
      }
      --static_cast<DBuffer*>(bufs.back())->ufree;
    }
    char *res = back;
    back += usize;
    ++num;
    return res;
  }

  std::list<CStream> streams;
  std::map<char*, CStream*> prebuilt;

  CStream* createStream(size_t usize)
  {
    streams.emplace_front();
    CStream &s = streams.front();
    {
      s.dynamic = true;
      s.bufs.push_back(new DBuffer(usize));
      s.front = s.bufs.back()->first;
      s.back = s.front;
      s.num = 0;
      s.usize = usize;
    }
    return &s;
  }

  template<typename T>
  CStream* createStream(hls::stream<T> *param)
  {
    CStream *s = createStream(sizeof(T));
    {
      s->dynamic = true;
      while (!param->empty()) {
        T data = param->read();
        memcpy(s->nextWrite(), (char*)&data, sizeof(T));
      }
      prebuilt[s->front] = s;
    }
    return s;
  }

  template<typename T>
  CStream* createStream(T *param, size_t usize)
  {
    streams.emplace_front();
    CStream &s = streams.front();
    {
      s.dynamic = false;
      s.bufs.push_back(new Buffer((char*)param));
      s.front = s.back = s.bufs.back()->first;
      s.usize = usize;
      s.num = ~0UL;
    }
    prebuilt[s.front] = &s;
    return &s;
  }

  CStream* findStream(char *buf)
  {
    return prebuilt.at(buf);
  }
}
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
extern "C" int spmv_accel(int*, int*, int*, int*, int*, int, int, int);
extern "C" int apatb_spmv_accel_hw(volatile void * __xlx_apatb_param_values, volatile void * __xlx_apatb_param_cols, volatile void * __xlx_apatb_param_rows, volatile void * __xlx_apatb_param_x, volatile void * __xlx_apatb_param_y, int __xlx_apatb_param_row_size, int __xlx_apatb_param_col_size, int __xlx_apatb_param_data_size) {
  // Collect __xlx_values__tmp_vec
  vector<sc_bv<32> >__xlx_values__tmp_vec;
  for (int j = 0, e = 9; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_values)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_values)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_values)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_values)[j*4+3];
    __xlx_values__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_values = 9;
  int __xlx_offset_param_values = 0;
  int __xlx_offset_byte_param_values = 0*4;
  int* __xlx_values__input_buffer= new int[__xlx_values__tmp_vec.size()];
  for (int i = 0; i < __xlx_values__tmp_vec.size(); ++i) {
    __xlx_values__input_buffer[i] = __xlx_values__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_cols__tmp_vec
  vector<sc_bv<32> >__xlx_cols__tmp_vec;
  for (int j = 0, e = 9; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_cols)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_cols)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_cols)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_cols)[j*4+3];
    __xlx_cols__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_cols = 9;
  int __xlx_offset_param_cols = 0;
  int __xlx_offset_byte_param_cols = 0*4;
  int* __xlx_cols__input_buffer= new int[__xlx_cols__tmp_vec.size()];
  for (int i = 0; i < __xlx_cols__tmp_vec.size(); ++i) {
    __xlx_cols__input_buffer[i] = __xlx_cols__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_rows__tmp_vec
  vector<sc_bv<32> >__xlx_rows__tmp_vec;
  for (int j = 0, e = 4; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_rows)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_rows)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_rows)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_rows)[j*4+3];
    __xlx_rows__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_rows = 4;
  int __xlx_offset_param_rows = 0;
  int __xlx_offset_byte_param_rows = 0*4;
  int* __xlx_rows__input_buffer= new int[__xlx_rows__tmp_vec.size()];
  for (int i = 0; i < __xlx_rows__tmp_vec.size(); ++i) {
    __xlx_rows__input_buffer[i] = __xlx_rows__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_x__tmp_vec
  vector<sc_bv<32> >__xlx_x__tmp_vec;
  for (int j = 0, e = 4; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_x)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_x)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_x)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_x)[j*4+3];
    __xlx_x__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_x = 4;
  int __xlx_offset_param_x = 0;
  int __xlx_offset_byte_param_x = 0*4;
  int* __xlx_x__input_buffer= new int[__xlx_x__tmp_vec.size()];
  for (int i = 0; i < __xlx_x__tmp_vec.size(); ++i) {
    __xlx_x__input_buffer[i] = __xlx_x__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_y__tmp_vec
  vector<sc_bv<32> >__xlx_y__tmp_vec;
  for (int j = 0, e = 4; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_y)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_y)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_y)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_y)[j*4+3];
    __xlx_y__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_y = 4;
  int __xlx_offset_param_y = 0;
  int __xlx_offset_byte_param_y = 0*4;
  int* __xlx_y__input_buffer= new int[__xlx_y__tmp_vec.size()];
  for (int i = 0; i < __xlx_y__tmp_vec.size(); ++i) {
    __xlx_y__input_buffer[i] = __xlx_y__tmp_vec[i].range(31, 0).to_uint64();
  }
  // DUT call
  int ap_return = spmv_accel(__xlx_values__input_buffer, __xlx_cols__input_buffer, __xlx_rows__input_buffer, __xlx_x__input_buffer, __xlx_y__input_buffer, __xlx_apatb_param_row_size, __xlx_apatb_param_col_size, __xlx_apatb_param_data_size);
// print __xlx_apatb_param_values
  sc_bv<32>*__xlx_values_output_buffer = new sc_bv<32>[__xlx_size_param_values];
  for (int i = 0; i < __xlx_size_param_values; ++i) {
    __xlx_values_output_buffer[i] = __xlx_values__input_buffer[i+__xlx_offset_param_values];
  }
  for (int i = 0; i < __xlx_size_param_values; ++i) {
    ((char*)__xlx_apatb_param_values)[i*4+0] = __xlx_values_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_values)[i*4+1] = __xlx_values_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_values)[i*4+2] = __xlx_values_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_values)[i*4+3] = __xlx_values_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_cols
  sc_bv<32>*__xlx_cols_output_buffer = new sc_bv<32>[__xlx_size_param_cols];
  for (int i = 0; i < __xlx_size_param_cols; ++i) {
    __xlx_cols_output_buffer[i] = __xlx_cols__input_buffer[i+__xlx_offset_param_cols];
  }
  for (int i = 0; i < __xlx_size_param_cols; ++i) {
    ((char*)__xlx_apatb_param_cols)[i*4+0] = __xlx_cols_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_cols)[i*4+1] = __xlx_cols_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_cols)[i*4+2] = __xlx_cols_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_cols)[i*4+3] = __xlx_cols_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_rows
  sc_bv<32>*__xlx_rows_output_buffer = new sc_bv<32>[__xlx_size_param_rows];
  for (int i = 0; i < __xlx_size_param_rows; ++i) {
    __xlx_rows_output_buffer[i] = __xlx_rows__input_buffer[i+__xlx_offset_param_rows];
  }
  for (int i = 0; i < __xlx_size_param_rows; ++i) {
    ((char*)__xlx_apatb_param_rows)[i*4+0] = __xlx_rows_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_rows)[i*4+1] = __xlx_rows_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_rows)[i*4+2] = __xlx_rows_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_rows)[i*4+3] = __xlx_rows_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_x
  sc_bv<32>*__xlx_x_output_buffer = new sc_bv<32>[__xlx_size_param_x];
  for (int i = 0; i < __xlx_size_param_x; ++i) {
    __xlx_x_output_buffer[i] = __xlx_x__input_buffer[i+__xlx_offset_param_x];
  }
  for (int i = 0; i < __xlx_size_param_x; ++i) {
    ((char*)__xlx_apatb_param_x)[i*4+0] = __xlx_x_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_x)[i*4+1] = __xlx_x_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_x)[i*4+2] = __xlx_x_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_x)[i*4+3] = __xlx_x_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_y
  sc_bv<32>*__xlx_y_output_buffer = new sc_bv<32>[__xlx_size_param_y];
  for (int i = 0; i < __xlx_size_param_y; ++i) {
    __xlx_y_output_buffer[i] = __xlx_y__input_buffer[i+__xlx_offset_param_y];
  }
  for (int i = 0; i < __xlx_size_param_y; ++i) {
    ((char*)__xlx_apatb_param_y)[i*4+0] = __xlx_y_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_y)[i*4+1] = __xlx_y_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_y)[i*4+2] = __xlx_y_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_y)[i*4+3] = __xlx_y_output_buffer[i].range(31, 24).to_uint();
  }
return ap_return;
}
