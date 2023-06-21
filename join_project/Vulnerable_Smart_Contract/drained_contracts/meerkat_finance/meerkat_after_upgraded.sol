# Palkeoramix decompiler. 

def storage:
  isInit is uint8 at storage 0 offset 160
  stor0 is uint32 at storage 0
  unknown02964ff1Address is addr at storage 0
  stor0 is uint256 at storage 0

def unknown02964ff1() payable: 
  return unknown02964ff1Address

def isInit() payable: 
  return bool(isInit)

#
#  Regular functions
#

def _fallback() payable: # default function
  revert

def init(address _oldContract) payable: 
  require calldata.size - 4 >= 32
  require not isInit
  unknown02964ff1Address = _oldContract
  isInit = 1

def changeOwner(address _newOwnerAddr) payable: 
  require calldata.size - 4 >= 32
  if unknown02964ff1Address != caller:
      revert with 0, 'dOwnable: caller isnot the owner'
  unknown02964ff1Address = _newOwnerAddr

def balanceOf(address _owner) payable: 
  require calldata.size - 4 >= 32
  require ext_code.size(_owner)
  static call _owner.balanceOf(address tokenOwner) with:
          gas gas_remaining wei
         args this.address
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  return ext_call.return_data[0]

def unknown8ca5f772(addr _param1, addr _param2, addr _param3) payable: 
  require calldata.size - 4 >= 96
  require ext_code.size(_param1)
  static call _param1.allowance(address tokenOwner, address spender) with:
          gas gas_remaining wei
         args addr(_param2), _param3
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  require ext_code.size(_param1)
  static call _param1.balanceOf(address tokenOwner) with:
          gas gas_remaining wei
         args _param2
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  return ext_call.return_data[0], ext_call.return_data[0]

def unknown70fcb0a7(addr _param1) payable: 
  require calldata.size - 4 >= 32
  if unknown02964ff1Address != caller:
      revert with 0, 'dOwnable: caller isnot the owner'
  require ext_code.size(_param1)
  static call _param1.balanceOf(address tokenOwner) with:
          gas gas_remaining wei
         args this.address
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  if 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 == ext_code.hash(_param1):
      revert with 0, 'SafeERC20: call to noncontract'
  if not ext_code.hash(_param1):
      revert with 0, 'SafeERC20: call to noncontract'
  mem[196 len 64] = transfer(address to, uint256 tokens), Mask(224, 0, stor0.field_0), uint32(stor0.field_0), ext_call.return_data[0 len 28]
  call _param1 with:
     funct uint32(stor0.field_0)
       gas gas_remaining wei
      args Mask(480, -256, ext_call.return_data << 256, mem[260 len 4]
  if not return_data.size:
      if not ext_call.success:
          revert with 0, 'SafeERC20: low-level call failed'
      if not transfer(address to, uint256 tokens), Mask(224, 0, stor0.field_0):
          revert with 0, 32, 41, 0xfe5361666545524332303a204552433230206f7065726174696f6e20646964206e6f74737563636565, mem[305 len 23]
  else:
      mem[228 len return_data.size] = ext_call.return_data[0 len return_data.size]
      if not ext_call.success:
          revert with 0, 'SafeERC20: low-level call failed'
      if return_data.size:
          require return_data.size >= 32
          if not mem[228]:
              revert with 0, 
                          32,
                          41,
                          0xfe5361666545524332303a204552433230206f7065726174696f6e20646964206e6f74737563636565,
                          mem[ceil32(return_data.size) + 306 len 23]

def transferFrom(address _from, address _to, uint256 _value) payable: 
  require calldata.size - 4 >= 96
  if unknown02964ff1Address != caller:
      revert with 0, 'dOwnable: caller isnot the owner'
  require ext_code.size(_from)
  static call _from.allowance(address tokenOwner, address spender) with:
          gas gas_remaining wei
         args addr(_to), this.address
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  require ext_code.size(_from)
  static call _from.balanceOf(address tokenOwner) with:
          gas gas_remaining wei
         args _to
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  if _value <= ext_call.return_data[0]:
      if _value <= ext_call.return_data[0]:
          if 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 == ext_code.hash(_from):
              revert with 0, 'SafeERC20: call to noncontract'
          if not ext_code.hash(_from):
              revert with 0, 'SafeERC20: call to noncontract'
          mem[228 len 96] = transferFrom(address from, address to, uint256 tokens), addr(_to) << 64, 0, addr(this.address), Mask(224, 32, _value) >> 32
          mem[352 len 4] = uint32(_value)
          call _from with:
               gas gas_remaining wei
              args Mask(224, 32, _value) << 480, mem[324 len 4]
          if not return_data.size:
              if not ext_call.success:
                  revert with 0, 'SafeERC20: low-level call failed'
              if not transferFrom(address from, address to, uint256 tokens), addr(_to) << 64:
                  revert with 0, 
                              32,
                              41,
                              0xfe5361666545524332303a204552433230206f7065726174696f6e20646964206e6f74737563636565,
                              mem[337 len 15],
                              uint32(_value),
                              mem[356 len 4]
          else:
              mem[260 len return_data.size] = ext_call.return_data[0 len return_data.size]
              if not ext_call.success:
                  revert with 0, 'SafeERC20: low-level call failed'
              if return_data.size:
                  require return_data.size >= 32
                  if not mem[260]:
                      revert with 0, 
                                  32,
                                  41,
                                  0xfe5361666545524332303a204552433230206f7065726174696f6e20646964206e6f74737563636565,
                                  mem[ceil32(return_data.size) + 338 len 23]

def unknown09ec1d8c(addr _param1, addr _param2, uint256 _param3) payable: 
  require calldata.size - 4 >= 96
  if unknown02964ff1Address != caller:
      revert with 0, 'dOwnable: caller isnot the owner'
  require ext_code.size(_param1)
  static call _param1.allowance(address tokenOwner, address spender) with:
          gas gas_remaining wei
         args addr(_param2), this.address
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  require ext_code.size(_param1)
  static call _param1.balanceOf(address tokenOwner) with:
          gas gas_remaining wei
         args _param2
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  if _param3 <= ext_call.return_data[0]:
      if _param3 <= ext_call.return_data[0]:
          if 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 == ext_code.hash(_param1):
              revert with 0, 'SafeERC20: call to noncontract'
          if not ext_code.hash(_param1):
              revert with 0, 'SafeERC20: call to noncontract'
          mem[228 len 96] = transferFrom(address from, address to, uint256 tokens), addr(_param2) << 64, 0, unknown02964ff1Address, Mask(224, 32, _param3) >> 32
          mem[352 len 4] = uint32(_param3)
          call _param1 with:
             funct uint32(stor0.field_0)
               gas gas_remaining wei
              args Mask(224, 32, _param3) << 480, mem[324 len 4]
          if not return_data.size:
              if not ext_call.success:
                  revert with 0, 'SafeERC20: low-level call failed'
              if not transferFrom(address from, address to, uint256 tokens), addr(_param2) << 64:
                  revert with 0, 
                              32,
                              41,
                              0xfe5361666545524332303a204552433230206f7065726174696f6e20646964206e6f74737563636565,
                              mem[337 len 15],
                              uint32(_param3),
                              mem[356 len 4]
          else:
              mem[260 len return_data.size] = ext_call.return_data[0 len return_data.size]
              if not ext_call.success:
                  revert with 0, 'SafeERC20: low-level call failed'
              if return_data.size:
                  require return_data.size >= 32
                  if not mem[260]:
                      revert with 0, 
                                  32,
                                  41,
                                  0xfe5361666545524332303a204552433230206f7065726174696f6e20646964206e6f74737563636565,
                                  mem[ceil32(return_data.size) + 338 len 23]

def unknowna4ebe0e7(addr _param1, addr _param2) payable: 
  require calldata.size - 4 >= 64
  if unknown02964ff1Address != caller:
      revert with 0, 'dOwnable: caller isnot the owner'
  require ext_code.size(_param1)
  static call _param1.allowance(address tokenOwner, address spender) with:
          gas gas_remaining wei
         args addr(_param2), this.address
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  require ext_code.size(_param1)
  static call _param1.balanceOf(address tokenOwner) with:
          gas gas_remaining wei
         args _param2
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  if unknown02964ff1Address != caller:
      revert with 0, 'dOwnable: caller isnot the owner'
  require ext_code.size(_param1)
  static call _param1.allowance(address tokenOwner, address spender) with:
          gas gas_remaining wei
         args addr(_param2), this.address
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  require ext_code.size(_param1)
  static call _param1.balanceOf(address tokenOwner) with:
          gas gas_remaining wei
         args _param2
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  if ext_call.return_data <= ext_call.return_data[0]:
      if ext_call.return_data <= ext_call.return_data[0]:
          if 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 == ext_code.hash(_param1):
              revert with 0, 'SafeERC20: call to noncontract'
          if not ext_code.hash(_param1):
              revert with 0, 'SafeERC20: call to noncontract'
          mem[228 len 96] = transferFrom(address from, address to, uint256 tokens), addr(_param2) << 64, 0, addr(this.address), ext_call.return_data[0 len 28]
          mem[352 len 4] = ext_call.return_data[20 len 4]
          call _param1 with:
               gas gas_remaining wei
              args Mask(736, -512, ext_call.return_data << 512, mem[324 len 4]
          if not return_data.size:
              if not ext_call.success:
                  revert with 0, 'SafeERC20: low-level call failed'
              if not transferFrom(address from, address to, uint256 tokens), addr(_param2) << 64:
                  revert with 0, 
                              32,
                              41,
                              0xfe5361666545524332303a204552433230206f7065726174696f6e20646964206e6f74737563636565,
                              mem[337 len 15],
                              ext_call.return_data[20 len 4],
                              mem[356 len 4]
          else:
              mem[260 len return_data.size] = ext_call.return_data[0 len return_data.size]
              if not ext_call.success:
                  revert with 0, 'SafeERC20: low-level call failed'
              if return_data.size:
                  require return_data.size >= 32
                  if not mem[260]:
                      revert with 0, 
                                  32,
                                  41,
                                  0xfe5361666545524332303a204552433230206f7065726174696f6e20646964206e6f74737563636565,
                                  mem[ceil32(return_data.size) + 338 len 23]

def unknown03476530(addr _param1, addr _param2) payable: 
  require calldata.size - 4 >= 64
  if unknown02964ff1Address != caller:
      revert with 0, 'dOwnable: caller isnot the owner'
  require ext_code.size(_param1)
  static call _param1.allowance(address tokenOwner, address spender) with:
          gas gas_remaining wei
         args addr(_param2), this.address
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  require ext_code.size(_param1)
  static call _param1.balanceOf(address tokenOwner) with:
          gas gas_remaining wei
         args _param2
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  if unknown02964ff1Address != caller:
      revert with 0, 'dOwnable: caller isnot the owner'
  require ext_code.size(_param1)
  static call _param1.allowance(address tokenOwner, address spender) with:
          gas gas_remaining wei
         args addr(_param2), this.address
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  require ext_code.size(_param1)
  static call _param1.balanceOf(address tokenOwner) with:
          gas gas_remaining wei
         args _param2
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  if ext_call.return_data <= ext_call.return_data[0]:
      if ext_call.return_data <= ext_call.return_data[0]:
          if 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 == ext_code.hash(_param1):
              revert with 0, 'SafeERC20: call to noncontract'
          if not ext_code.hash(_param1):
              revert with 0, 'SafeERC20: call to noncontract'
          mem[228 len 96] = transferFrom(address from, address to, uint256 tokens), addr(_param2) << 64, 0, unknown02964ff1Address, ext_call.return_data[0 len 28]
          mem[352 len 4] = ext_call.return_data[20 len 4]
          call _param1 with:
             funct uint32(stor0.field_0)
               gas gas_remaining wei
              args Mask(736, -512, ext_call.return_data << 512, mem[324 len 4]
          if not return_data.size:
              if not ext_call.success:
                  revert with 0, 'SafeERC20: low-level call failed'
              if not transferFrom(address from, address to, uint256 tokens), addr(_param2) << 64:
                  revert with 0, 
                              32,
                              41,
                              0xfe5361666545524332303a204552433230206f7065726174696f6e20646964206e6f74737563636565,
                              mem[337 len 15],
                              ext_call.return_data[20 len 4],
                              mem[356 len 4]
          else:
              mem[260 len return_data.size] = ext_call.return_data[0 len return_data.size]
              if not ext_call.success:
                  revert with 0, 'SafeERC20: low-level call failed'
              if return_data.size:
                  require return_data.size >= 32
                  if not mem[260]:
                      revert with 0, 
                                  32,
                                  41,
                                  0xfe5361666545524332303a204552433230206f7065726174696f6e20646964206e6f74737563636565,
                                  mem[ceil32(return_data.size) + 338 len 23]

def unknownef000629() payable: 
  mem[64] = 96
  require calldata.size - 4 >= 32
  require cd <= 4294967296
  require cd <= calldata.size
  require ('cd', 4).length <= 4294967296 and cd * ('cd', 4).length) + 36 <= calldata.size
  if unknown02964ff1Address != caller:
      revert with 0, 'dOwnable: caller isnot the owner'
  idx = 0
  while idx < ('cd', 4).length:
      if unknown02964ff1Address != caller:
          revert with 0, 'dOwnable: caller isnot the owner'
      mem[mem[64] + 4] = this.address
      require ext_code.size(addr(cd[((32 * idx) + cd))
      static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
              gas gas_remaining wei
             args this.address
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      require return_data.size >= 32
      _49 = mem[64]
      mem[mem[64] + 36] = unknown02964ff1Address
      mem[mem[64] + 68] = ext_call.return_data[0]
      _50 = mem[64]
      mem[mem[64]] = 68
      mem[64] = mem[64] + 100
      mem[_50 + 32] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000 or mem[_50 + 36 len 28]
      if 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 == ext_code.hash(addr(cd[((32 * idx) + cd)):
          revert with 0, 'SafeERC20: call to noncontract'
      if not ext_code.hash(addr(cd[((32 * idx) + cd)):
          revert with 0, 'SafeERC20: call to noncontract'
      _55 = mem[_50]
      t = _50 + 32
      u = mem[64]
      s = mem[_50]
      while s >= 32:
          mem[u] = mem[t]
          t = t + 32
          u = u + 32
          s = s - 32
          continue 
      mem[mem[64] + floor32(mem[_50])] = mem[_50 + floor32(mem[_50]) + -(mem[_50] % 32) + 64 len mem[_50] % 32] or Mask(8 * -(mem[_50] % 32) + 32, -(8 * -(mem[_50] % 32) + 32) + 256, mem[mem[64] + floor32(mem[_50])])
      call addr(cd[((32 * idx) + cd).mem[mem[64] len 4] with:
           gas gas_remaining wei
          args mem[mem[64] + 4 len _55 + _49 + -mem[64] + 96]
      if not return_data.size:
          if not ext_call.success:
              revert with 0, 'SafeERC20: low-level call failed'
          if mem[96]:
              require mem[96] >= 32
              if not mem[128]:
                  revert with 0, 
                              32,
                              41,
                              0xfe5361666545524332303a204552433230206f7065726174696f6e20646964206e6f74737563636565,
                              mem[mem[64] + 109 len 23]
      else:
          _81 = mem[64]
          mem[64] = mem[64] + ceil32(return_data.size) + 1
          mem[_81] = return_data.size
          mem[_81 + 32 len return_data.size] = ext_call.return_data[0 len return_data.size]
          if not ext_call.success:
              revert with 0, 'SafeERC20: low-level call failed'
          if return_data.size:
              require return_data.size >= 32
              if not mem[_81 + 32]:
                  revert with 0, 
                              32,
                              41,
                              0xfe5361666545524332303a204552433230206f7065726174696f6e20646964206e6f74737563636565,
                              mem[mem[64] + 109 len 23]
      idx = idx + 1
      continue 

def unknown979c341b(addr _param1, array _param2, uint256 _param3) payable: 
  require calldata.size - 4 >= 96
  require _param2 <= 4294967296
  require _param2 + 36 <= calldata.size
  require _param2.length <= 4294967296 and _param2 + (32 * _param2.length) + 36 <= calldata.size
  mem[64] = (32 * _param2.length) + 128
  mem[96] = _param2.length
  mem[128 len 32 * _param2.length] = call.data[_param2 + 36 len 32 * _param2.length]
  mem[(32 * _param2.length) + 128] = 0
  if unknown02964ff1Address != caller:
      revert with 0, 'dOwnable: caller isnot the owner'
  idx = 0
  while idx < _param2.length:
      require idx < mem[96]
      _51 = mem[(32 * idx) + 128]
      if unknown02964ff1Address != caller:
          revert with 0, 'dOwnable: caller isnot the owner'
      mem[mem[64] + 4] = mem[(32 * idx) + 140 len 20]
      mem[mem[64] + 36] = this.address
      require ext_code.size(_param1)
      static call _param1.allowance(address tokenOwner, address spender) with:
              gas gas_remaining wei
             args mem[mem[64] + 4], addr(this.address)
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      require return_data.size >= 32
      mem[mem[64] + 4] = addr(_51)
      require ext_code.size(_param1)
      static call _param1.balanceOf(address tokenOwner) with:
              gas gas_remaining wei
             args addr(_51)
      mem[mem[64]] = ext_call.return_data[0]
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      require return_data.size >= 32
      if _param3 <= ext_call.return_data[0]:
          if _param3 <= ext_call.return_data[0]:
              _64 = mem[64]
              mem[mem[64] + 36] = addr(_51)
              mem[mem[64] + 68] = this.address
              mem[mem[64] + 100] = _param3
              _65 = mem[64]
              mem[mem[64]] = 100
              mem[64] = mem[64] + 132
              mem[_65 + 32] = 0x23b872dd00000000000000000000000000000000000000000000000000000000 or mem[_65 + 36 len 28]
              if 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 == ext_code.hash(_param1):
                  revert with 0, 'SafeERC20: call to noncontract'
              if not ext_code.hash(_param1):
                  revert with 0, 'SafeERC20: call to noncontract'
              _70 = mem[_65]
              t = _65 + 32
              u = mem[64]
              s = mem[_65]
              while s >= 32:
                  mem[u] = mem[t]
                  t = t + 32
                  u = u + 32
                  s = s - 32
                  continue 
              mem[mem[64] + floor32(mem[_65])] = mem[_65 + floor32(mem[_65]) + -(mem[_65] % 32) + 64 len mem[_65] % 32] or Mask(8 * -(mem[_65] % 32) + 32, -(8 * -(mem[_65] % 32) + 32) + 256, mem[mem[64] + floor32(mem[_65])])
              call _param1.mem[mem[64] len 4] with:
                   gas gas_remaining wei
                  args mem[mem[64] + 4 len _70 + _64 + -mem[64] + 128]
              if not return_data.size:
                  if not ext_call.success:
                      revert with 0, 'SafeERC20: low-level call failed'
                  if mem[96]:
                      require mem[96] >= 32
                      if not mem[128]:
                          revert with 0, 
                                      32,
                                      41,
                                      0xfe5361666545524332303a204552433230206f7065726174696f6e20646964206e6f74737563636565,
                                      mem[mem[64] + 109 len 23]
              else:
                  _96 = mem[64]
                  mem[64] = mem[64] + ceil32(return_data.size) + 1
                  mem[_96] = return_data.size
                  mem[_96 + 32 len return_data.size] = ext_call.return_data[0 len return_data.size]
                  if not ext_call.success:
                      revert with 0, 'SafeERC20: low-level call failed'
                  if return_data.size:
                      require return_data.size >= 32
                      if not mem[_96 + 32]:
                          revert with 0, 
                                      32,
                                      41,
                                      0xfe5361666545524332303a204552433230206f7065726174696f6e20646964206e6f74737563636565,
                                      mem[mem[64] + 109 len 23]
      idx = idx + 1
      continue 

def unknown797f5289() payable: 
  mem[64] = 96
  require calldata.size - 4 >= 96
  require cd <= 4294967296
  require cd <= calldata.size
  require ('cd', 4).length <= 4294967296 and cd * ('cd', 4).length) + 36 <= calldata.size
  require cd <= 4294967296
  require cd <= calldata.size
  require ('cd', 36).length <= 4294967296 and cd * ('cd', 36).length) + 36 <= calldata.size
  if unknown02964ff1Address != caller:
      revert with 0, 'dOwnable: caller isnot the owner'
  idx = 0
  while idx < ('cd', 4).length:
      _53 = mem[64]
      mem[64] = mem[64] + (32 * ('cd', 36).length) + 32
      mem[_53] = ('cd', 36).length
      mem[_53 + 32 len 32 * ('cd', 36).length] = call.data[cd * ('cd', 36).length]
      mem[_53 + (32 * ('cd', 36).length) + 32] = 0
      if unknown02964ff1Address != caller:
          revert with 0, 'dOwnable: caller isnot the owner'
      s = 0
      while s < ('cd', 36).length:
          require s < mem[_53]
          _103 = mem[(32 * s) + _53 + 32]
          if unknown02964ff1Address != caller:
              revert with 0, 'dOwnable: caller isnot the owner'
          mem[mem[64] + 4] = mem[(32 * s) + _53 + 44 len 20]
          mem[mem[64] + 36] = this.address
          require ext_code.size(addr(cd[((32 * idx) + cd))
          static call addr(cd[((32 * idx) + cd).allowance(address tokenOwner, address spender) with:
                  gas gas_remaining wei
                 args mem[mem[64] + 4], addr(this.address)
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          require return_data.size >= 32
          mem[mem[64] + 4] = addr(_103)
          require ext_code.size(addr(cd[((32 * idx) + cd))
          static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                  gas gas_remaining wei
                 args addr(_103)
          mem[mem[64]] = ext_call.return_data[0]
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          require return_data.size >= 32
          if cd <= ext_call.return_data[0]:
              if cd <= ext_call.return_data[0]:
                  _116 = mem[64]
                  mem[mem[64] + 36] = addr(_103)
                  mem[mem[64] + 68] = this.address
                  mem[mem[64] + 100] = cd[68]
                  _117 = mem[64]
                  mem[mem[64]] = 100
                  mem[64] = mem[64] + 132
                  mem[_117 + 32] = 0x23b872dd00000000000000000000000000000000000000000000000000000000 or mem[_117 + 36 len 28]
                  if 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 == ext_code.hash(addr(cd[((32 * idx) + cd)):
                      revert with 0, 'SafeERC20: call to noncontract'
                  if not ext_code.hash(addr(cd[((32 * idx) + cd)):
                      revert with 0, 'SafeERC20: call to noncontract'
                  _122 = mem[_117]
                  u = _117 + 32
                  v = mem[64]
                  t = mem[_117]
                  while t >= 32:
                      mem[v] = mem[u]
                      u = u + 32
                      v = v + 32
                      t = t - 32
                      continue 
                  mem[mem[64] + floor32(mem[_117])] = mem[_117 + floor32(mem[_117]) + -(mem[_117] % 32) + 64 len mem[_117] % 32] or Mask(8 * -(mem[_117] % 32) + 32, -(8 * -(mem[_117] % 32) + 32) + 256, mem[mem[64] + floor32(mem[_117])])
                  call addr(cd[((32 * idx) + cd).mem[mem[64] len 4] with:
                       gas gas_remaining wei
                      args mem[mem[64] + 4 len _122 + _116 + -mem[64] + 128]
                  if not return_data.size:
                      if not ext_call.success:
                          revert with 0, 'SafeERC20: low-level call failed'
                      if mem[96]:
                          require mem[96] >= 32
                          if not mem[128]:
                              revert with 0, 
                                          32,
                                          41,
                                          0xfe5361666545524332303a204552433230206f7065726174696f6e20646964206e6f74737563636565,
                                          mem[mem[64] + 109 len 23]
                  else:
                      _148 = mem[64]
                      mem[64] = mem[64] + ceil32(return_data.size) + 1
                      mem[_148] = return_data.size
                      mem[_148 + 32 len return_data.size] = ext_call.return_data[0 len return_data.size]
                      if not ext_call.success:
                          revert with 0, 'SafeERC20: low-level call failed'
                      if return_data.size:
                          require return_data.size >= 32
                          if not mem[_148 + 32]:
                              revert with 0, 
                                          32,
                                          41,
                                          0xfe5361666545524332303a204552433230206f7065726174696f6e20646964206e6f74737563636565,
                                          mem[mem[64] + 109 len 23]
          s = s + 1
          continue 
      idx = idx + 1
      continue 

def unknowna67e827f(addr _param1, array _param2) payable: 
  require calldata.size - 4 >= 64
  require _param2 <= 4294967296
  require _param2 + 36 <= calldata.size
  require _param2.length <= 4294967296 and _param2 + (32 * _param2.length) + 36 <= calldata.size
  mem[64] = (32 * _param2.length) + 128
  mem[96] = _param2.length
  mem[128 len 32 * _param2.length] = call.data[_param2 + 36 len 32 * _param2.length]
  mem[(32 * _param2.length) + 128] = 0
  if unknown02964ff1Address != caller:
      revert with 0, 'dOwnable: caller isnot the owner'
  idx = 0
  while idx < _param2.length:
      require idx < mem[96]
      _103 = mem[(32 * idx) + 128]
      if unknown02964ff1Address != caller:
          revert with 0, 'dOwnable: caller isnot the owner'
      mem[mem[64] + 4] = mem[(32 * idx) + 140 len 20]
      require ext_code.size(_param1)
      static call _param1.allowance(address tokenOwner, address spender) with:
              gas gas_remaining wei
             args mem[mem[64] + 4], addr(this.address)
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      require return_data.size >= 32
      require ext_code.size(_param1)
      static call _param1.balanceOf(address tokenOwner) with:
              gas gas_remaining wei
             args addr(_103)
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      require return_data.size >= 32
      if unknown02964ff1Address != caller:
          revert with 0, 'dOwnable: caller isnot the owner'
      mem[mem[64] + 36] = this.address
      require ext_code.size(_param1)
      static call _param1.allowance(address tokenOwner, address spender) with:
              gas gas_remaining wei
             args addr(_103), this.address
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      require return_data.size >= 32
      mem[mem[64] + 4] = addr(_103)
      require ext_code.size(_param1)
      static call _param1.balanceOf(address tokenOwner) with:
              gas gas_remaining wei
             args addr(_103)
      mem[mem[64]] = ext_call.return_data[0]
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      require return_data.size >= 32
      if ext_call.return_data >= ext_call.return_data[0]:
          if ext_call.return_data <= ext_call.return_data[0]:
              if ext_call.return_data <= ext_call.return_data[0]:
                  _140 = mem[64]
                  mem[mem[64] + 36] = addr(_103)
                  mem[mem[64] + 68] = this.address
                  mem[mem[64] + 100] = ext_call.return_data[0]
                  _141 = mem[64]
                  mem[mem[64]] = 100
                  mem[64] = mem[64] + 132
                  mem[_141 + 32] = 0x23b872dd00000000000000000000000000000000000000000000000000000000 or mem[_141 + 36 len 28]
                  if 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 == ext_code.hash(_param1):
                      revert with 0, 'SafeERC20: call to noncontract'
                  if not ext_code.hash(_param1):
                      revert with 0, 'SafeERC20: call to noncontract'
                  _151 = mem[_141]
                  t = _141 + 32
                  u = mem[64]
                  s = mem[_141]
                  while s >= 32:
                      mem[u] = mem[t]
                      t = t + 32
                      u = u + 32
                      s = s - 32
                      continue 
                  mem[mem[64] + floor32(mem[_141])] = mem[_141 + floor32(mem[_141]) + -(mem[_141] % 32) + 64 len mem[_141] % 32] or Mask(8 * -(mem[_141] % 32) + 32, -(8 * -(mem[_141] % 32) + 32) + 256, mem[mem[64] + floor32(mem[_141])])
                  call _param1.mem[mem[64] len 4] with:
                       gas gas_remaining wei
                      args mem[mem[64] + 4 len _151 + _140 + -mem[64] + 128]
                  if not return_data.size:
                      if not ext_call.success:
                          revert with 0, 'SafeERC20: low-level call failed'
                      if mem[96]:
                          require mem[96] >= 32
                          if not mem[128]:
                              revert with 0, 
                                          32,
                                          41,
                                          0xfe5361666545524332303a204552433230206f7065726174696f6e20646964206e6f74737563636565,
                                          mem[mem[64] + 109 len 23]
                  else:
                      _204 = mem[64]
                      mem[64] = mem[64] + ceil32(return_data.size) + 1
                      mem[_204] = return_data.size
                      mem[_204 + 32 len return_data.size] = ext_call.return_data[0 len return_data.size]
                      if not ext_call.success:
                          revert with 0, 'SafeERC20: low-level call failed'
                      if return_data.size:
                          require return_data.size >= 32
                          if not mem[_204 + 32]:
                              revert with 0, 
                                          32,
                                          41,
                                          0xfe5361666545524332303a204552433230206f7065726174696f6e20646964206e6f74737563636565,
                                          mem[mem[64] + 109 len 23]
      else:
          if ext_call.return_data <= ext_call.return_data[0]:
              if ext_call.return_data <= ext_call.return_data[0]:
                  _143 = mem[64]
                  mem[mem[64] + 36] = addr(_103)
                  mem[mem[64] + 68] = this.address
                  mem[mem[64] + 100] = ext_call.return_data[0]
                  _144 = mem[64]
                  mem[mem[64]] = 100
                  mem[64] = mem[64] + 132
                  mem[_144 + 32] = 0x23b872dd00000000000000000000000000000000000000000000000000000000 or mem[_144 + 36 len 28]
                  if 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 == ext_code.hash(_param1):
                      revert with 0, 'SafeERC20: call to noncontract'
                  if not ext_code.hash(_param1):
                      revert with 0, 'SafeERC20: call to noncontract'
                  _155 = mem[_144]
                  t = _144 + 32
                  u = mem[64]
                  s = mem[_144]
                  while s >= 32:
                      mem[u] = mem[t]
                      t = t + 32
                      u = u + 32
                      s = s - 32
                      continue 
                  mem[mem[64] + floor32(mem[_144])] = mem[_144 + floor32(mem[_144]) + -(mem[_144] % 32) + 64 len mem[_144] % 32] or Mask(8 * -(mem[_144] % 32) + 32, -(8 * -(mem[_144] % 32) + 32) + 256, mem[mem[64] + floor32(mem[_144])])
                  call _param1.mem[mem[64] len 4] with:
                       gas gas_remaining wei
                      args mem[mem[64] + 4 len _155 + _143 + -mem[64] + 128]
                  if not return_data.size:
                      if not ext_call.success:
                          revert with 0, 'SafeERC20: low-level call failed'
                      if mem[96]:
                          require mem[96] >= 32
                          if not mem[128]:
                              revert with 0, 
                                          32,
                                          41,
                                          0xfe5361666545524332303a204552433230206f7065726174696f6e20646964206e6f74737563636565,
                                          mem[mem[64] + 109 len 23]
                  else:
                      _205 = mem[64]
                      mem[64] = mem[64] + ceil32(return_data.size) + 1
                      mem[_205] = return_data.size
                      mem[_205 + 32 len return_data.size] = ext_call.return_data[0 len return_data.size]
                      if not ext_call.success:
                          revert with 0, 'SafeERC20: low-level call failed'
                      if return_data.size:
                          require return_data.size >= 32
                          if not mem[_205 + 32]:
                              revert with 0, 
                                          32,
                                          41,
                                          0xfe5361666545524332303a204552433230206f7065726174696f6e20646964206e6f74737563636565,
                                          mem[mem[64] + 109 len 23]
      idx = idx + 1
      continue 

def unknown1bcc9bc4() payable: 
  mem[64] = 96
  require calldata.size - 4 >= 64
  require cd <= 4294967296
  require cd <= calldata.size
  require ('cd', 4).length <= 4294967296 and cd * ('cd', 4).length) + 36 <= calldata.size
  require cd <= 4294967296
  require cd <= calldata.size
  require ('cd', 36).length <= 4294967296 and cd * ('cd', 36).length) + 36 <= calldata.size
  if unknown02964ff1Address != caller:
      revert with 0, 'dOwnable: caller isnot the owner'
  idx = 0
  while idx < ('cd', 4).length:
      _105 = mem[64]
      mem[64] = mem[64] + (32 * ('cd', 36).length) + 32
      mem[_105] = ('cd', 36).length
      mem[_105 + 32 len 32 * ('cd', 36).length] = call.data[cd * ('cd', 36).length]
      mem[_105 + (32 * ('cd', 36).length) + 32] = 0
      if unknown02964ff1Address != caller:
          revert with 0, 'dOwnable: caller isnot the owner'
      s = 0
      while s < ('cd', 36).length:
          require s < mem[_105]
          _207 = mem[(32 * s) + _105 + 32]
          if unknown02964ff1Address != caller:
              revert with 0, 'dOwnable: caller isnot the owner'
          mem[mem[64] + 4] = mem[(32 * s) + _105 + 44 len 20]
          require ext_code.size(addr(cd[((32 * idx) + cd))
          static call addr(cd[((32 * idx) + cd).allowance(address tokenOwner, address spender) with:
                  gas gas_remaining wei
                 args mem[mem[64] + 4], addr(this.address)
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          require return_data.size >= 32
          require ext_code.size(addr(cd[((32 * idx) + cd))
          static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                  gas gas_remaining wei
                 args addr(_207)
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          require return_data.size >= 32
          if unknown02964ff1Address != caller:
              revert with 0, 'dOwnable: caller isnot the owner'
          mem[mem[64] + 36] = this.address
          require ext_code.size(addr(cd[((32 * idx) + cd))
          static call addr(cd[((32 * idx) + cd).allowance(address tokenOwner, address spender) with:
                  gas gas_remaining wei
                 args addr(_207), this.address
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          require return_data.size >= 32
          mem[mem[64] + 4] = addr(_207)
          require ext_code.size(addr(cd[((32 * idx) + cd))
          static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                  gas gas_remaining wei
                 args addr(_207)
          mem[mem[64]] = ext_call.return_data[0]
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          require return_data.size >= 32
          if ext_call.return_data >= ext_call.return_data[0]:
              if ext_call.return_data <= ext_call.return_data[0]:
                  if ext_call.return_data <= ext_call.return_data[0]:
                      _244 = mem[64]
                      mem[mem[64] + 36] = addr(_207)
                      mem[mem[64] + 68] = this.address
                      mem[mem[64] + 100] = ext_call.return_data[0]
                      _245 = mem[64]
                      mem[mem[64]] = 100
                      mem[64] = mem[64] + 132
                      mem[_245 + 32] = 0x23b872dd00000000000000000000000000000000000000000000000000000000 or mem[_245 + 36 len 28]
                      if 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 == ext_code.hash(addr(cd[((32 * idx) + cd)):
                          revert with 0, 'SafeERC20: call to noncontract'
                      if not ext_code.hash(addr(cd[((32 * idx) + cd)):
                          revert with 0, 'SafeERC20: call to noncontract'
                      _255 = mem[_245]
                      u = _245 + 32
                      v = mem[64]
                      t = mem[_245]
                      while t >= 32:
                          mem[v] = mem[u]
                          u = u + 32
                          v = v + 32
                          t = t - 32
                          continue 
                      mem[mem[64] + floor32(mem[_245])] = mem[_245 + floor32(mem[_245]) + -(mem[_245] % 32) + 64 len mem[_245] % 32] or Mask(8 * -(mem[_245] % 32) + 32, -(8 * -(mem[_245] % 32) + 32) + 256, mem[mem[64] + floor32(mem[_245])])
                      call addr(cd[((32 * idx) + cd).mem[mem[64] len 4] with:
                           gas gas_remaining wei
                          args mem[mem[64] + 4 len _255 + _244 + -mem[64] + 128]
                      if not return_data.size:
                          if not ext_call.success:
                              revert with 0, 'SafeERC20: low-level call failed'
                          if mem[96]:
                              require mem[96] >= 32
                              if not mem[128]:
                                  revert with 0, 
                                              32,
                                              41,
                                              0xfe5361666545524332303a204552433230206f7065726174696f6e20646964206e6f74737563636565,
                                              mem[mem[64] + 109 len 23]
                      else:
                          _308 = mem[64]
                          mem[64] = mem[64] + ceil32(return_data.size) + 1
                          mem[_308] = return_data.size
                          mem[_308 + 32 len return_data.size] = ext_call.return_data[0 len return_data.size]
                          if not ext_call.success:
                              revert with 0, 'SafeERC20: low-level call failed'
                          if return_data.size:
                              require return_data.size >= 32
                              if not mem[_308 + 32]:
                                  revert with 0, 
                                              32,
                                              41,
                                              0xfe5361666545524332303a204552433230206f7065726174696f6e20646964206e6f74737563636565,
                                              mem[mem[64] + 109 len 23]
          else:
              if ext_call.return_data <= ext_call.return_data[0]:
                  if ext_call.return_data <= ext_call.return_data[0]:
                      _247 = mem[64]
                      mem[mem[64] + 36] = addr(_207)
                      mem[mem[64] + 68] = this.address
                      mem[mem[64] + 100] = ext_call.return_data[0]
                      _248 = mem[64]
                      mem[mem[64]] = 100
                      mem[64] = mem[64] + 132
                      mem[_248 + 32] = 0x23b872dd00000000000000000000000000000000000000000000000000000000 or mem[_248 + 36 len 28]
                      if 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 == ext_code.hash(addr(cd[((32 * idx) + cd)):
                          revert with 0, 'SafeERC20: call to noncontract'
                      if not ext_code.hash(addr(cd[((32 * idx) + cd)):
                          revert with 0, 'SafeERC20: call to noncontract'
                      _259 = mem[_248]
                      u = _248 + 32
                      v = mem[64]
                      t = mem[_248]
                      while t >= 32:
                          mem[v] = mem[u]
                          u = u + 32
                          v = v + 32
                          t = t - 32
                          continue 
                      mem[mem[64] + floor32(mem[_248])] = mem[_248 + floor32(mem[_248]) + -(mem[_248] % 32) + 64 len mem[_248] % 32] or Mask(8 * -(mem[_248] % 32) + 32, -(8 * -(mem[_248] % 32) + 32) + 256, mem[mem[64] + floor32(mem[_248])])
                      call addr(cd[((32 * idx) + cd).mem[mem[64] len 4] with:
                           gas gas_remaining wei
                          args mem[mem[64] + 4 len _259 + _247 + -mem[64] + 128]
                      if not return_data.size:
                          if not ext_call.success:
                              revert with 0, 'SafeERC20: low-level call failed'
                          if mem[96]:
                              require mem[96] >= 32
                              if not mem[128]:
                                  revert with 0, 
                                              32,
                                              41,
                                              0xfe5361666545524332303a204552433230206f7065726174696f6e20646964206e6f74737563636565,
                                              mem[mem[64] + 109 len 23]
                      else:
                          _309 = mem[64]
                          mem[64] = mem[64] + ceil32(return_data.size) + 1
                          mem[_309] = return_data.size
                          mem[_309 + 32 len return_data.size] = ext_call.return_data[0 len return_data.size]
                          if not ext_call.success:
                              revert with 0, 'SafeERC20: low-level call failed'
                          if return_data.size:
                              require return_data.size >= 32
                              if not mem[_309 + 32]:
                                  revert with 0, 
                                              32,
                                              41,
                                              0xfe5361666545524332303a204552433230206f7065726174696f6e20646964206e6f74737563636565,
                                              mem[mem[64] + 109 len 23]
          s = s + 1
          continue 
      idx = idx + 1
      continue 