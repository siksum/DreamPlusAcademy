# Palkeoramix decompiler. 

const unknown6ed93dd0 = 10000

def storage:
  paused is uint8 at storage 0
  owner is addr at storage 0 offset 8
  start is uint256 at storage 1
  finish is uint256 at storage 2
  unknown3e79dafa is array of uint256 at storage 3
  unknown8aa71faa is array of uint256 at storage 4
  released is uint256 at storage 5
  stor6 is bool at storage 6 offset 256
  hasInitialized is uint8 at storage 6
  tokenAddress is addr at storage 6 offset 8
  userData is mapping of struct at storage 7

def hasInitialized() payable: 
  return bool(hasInitialized)

def unknown3e79dafa(uint256 _param1) payable: 
  require calldata.size - 4 >= 32
  require _param1 < unknown3e79dafa.length
  return unknown3e79dafa[_param1]

def paused() payable: 
  return bool(paused)

def unknown8aa71faa(uint256 _param1) payable: 
  require calldata.size - 4 >= 32
  require _param1 < unknown8aa71faa.length
  return unknown8aa71faa[_param1]

def owner() payable: 
  return owner

def released() payable: 
  return released

def start() payable: 
  return start

def finish() payable: 
  return finish

def token() payable: 
  return tokenAddress

def getUserData(address _user) payable: 
  require calldata.size - 4 >= 32
  return userData[addr(_user)].field_0, userData[addr(_user)].field_256

#
#  Regular functions
#

def _fallback() payable: # default function
  revert

def pause() payable: 
  if owner != caller:
      revert with 0, 'wOwnable: caller is not the owne'
  if paused:
      revert with 0, 'Pausable: paused'
  paused = 1
  log Paused(address account=caller)

def unpause() payable: 
  if owner != caller:
      revert with 0, 'wOwnable: caller is not the owne'
  if not paused:
      revert with 0, 'Pausable: not paused'
  paused = 0
  log Unpaused(address account=caller)

def renounceOwnership() payable: 
  if owner != caller:
      revert with 0, 'wOwnable: caller is not the owne'
  log OwnershipTransferred(
        address previousOwner=owner,
        address newOwner=0)
  owner = 0

def transferOwnership(address _newOwner) payable: 
  require calldata.size - 4 >= 32
  if owner != caller:
      revert with 0, 'wOwnable: caller is not the owne'
  if not _newOwner:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                  32,
                  38,
                  0x214f776e61626c653a206e6577206f776e657220697320746865207a65726f20616464726573,
                  mem[202 len 26]
  log OwnershipTransferred(
        address previousOwner=owner,
        address newOwner=_newOwner)
  owner = _newOwner

def unknowna441d067(addr _param1) payable: 
  require calldata.size - 4 >= 32
  if owner != caller:
      revert with 0, 'wOwnable: caller is not the owne'
  require ext_code.size(tokenAddress)
  static call tokenAddress.balanceOf(address tokenOwner) with:
          gas gas_remaining wei
         args this.address
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  if eth.balance(this.address) < 0:
      revert with 0, 32, 38, 0x73416464726573733a20696e73756666696369656e742062616c616e636520666f722063616c, mem[366 len 26]
  if not ext_code.size(tokenAddress):
      revert with 0, 'Address: call to non-contract'
  mem[260 len 64] = transfer(address to, uint256 tokens), addr(_param1) << 64, 0, ext_call.return_data[0 len 28]
  mem[324 len 0] = 0
  call tokenAddress with:
       gas gas_remaining wei
      args Mask(480, -256, ext_call.return_data << 256, mem[324 len 4]
  if not return_data.size:
      if not ext_call.success:
          revert with transfer(address to, uint256 tokens), addr(_param1) << 64, 0, ext_call.return_data[0]
      if not transfer(address to, uint256 tokens), addr(_param1) << 64:
          revert with 0, 32, 42, 0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565, mem[370 len 22]
  else:
      mem[292 len return_data.size] = ext_call.return_data[0 len return_data.size]
      if not ext_call.success:
          if return_data.size:
              revert with ext_call.return_data[0 len return_data.size]
          revert with 0, 'SafeERC20: low-level call failed'
      if return_data.size:
          require return_data.size >= 32
          if not mem[292]:
              revert with 0, 
                          32,
                          42,
                          0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565,
                          mem[ceil32(return_data.size) + 371 len 22]

def unknowna8362a70() payable: 
  require calldata.size - 4 >= 64
  require cd <= 4294967296
  require cd <= calldata.size
  require ('cd', 4).length <= 4294967296 and cd * ('cd', 4).length) + 36 <= calldata.size
  require cd <= 4294967296
  require cd <= calldata.size
  require ('cd', 36).length <= 4294967296 and cd * ('cd', 36).length) + 36 <= calldata.size
  if owner != caller:
      revert with 0, 'wOwnable: caller is not the owne'
  if not hasInitialized:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                  32,
                  78,
                  0x2161646457686974656c697374656455736572733a20496e697469616c697a6174696f6e2073686f756c6420626520646f6e65206265666f72652063616c6c696e672074686973206d6574686f64,
                  mem[242 len 18]
  if not ('cd', 4).length:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                  32,
                  49,
                  0x2161646457686974656c697374656455736572733a20636f756c64206e6f742062652030206c656e677468206172726179,
                  mem[213 len 15]
  if ('cd', 36).length != ('cd', 4).length:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                  32,
                  58,
                  0x7261646457686974656c697374656455736572733a20636f756c64206e6f7420626520646966666572656e74206c656e67746820617272617973,
                  mem[222 len 6]
  idx = 0
  while idx < ('cd', 4).length:
      if userData[addr(cd[((32 * idx) + cd)].field_0:
          revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                      32,
                      56,
                      0x2161646457686974656c697374656455736572733a20536f6d652075736572732061726520616c72656164792077686974656c6973746564,
                      mem[220 len 8]
      require idx < ('cd', 36).length
      require idx < ('cd', 4).length
      mem[0] = addr(cd[((32 * idx) + cd)
      mem[32] = 7
      userData[addr(cd[((32 * idx) + cd)].field_0 = cd[((32 * idx) + cd[36] + 36)]
      idx = idx + 1
      continue 

def unknownb5b3d8f8(addr _param1, addr _param2) payable: 
  require calldata.size - 4 >= 64
  if owner != caller:
      revert with 0, 'wOwnable: caller is not the owne'
  if userData[addr(_param1)].field_256 > userData[addr(_param1)].field_0:
      revert with 0, 'SafeMath: subtraction overflow'
  if userData[addr(_param1)].field_0 < userData[addr(_param1)].field_256:
      revert with 0, 'SafeMath: addition overflow'
  userData[addr(_param1)].field_256 = userData[addr(_param1)].field_0
  if eth.balance(this.address) < 0:
      revert with 0, 32, 38, 0x73416464726573733a20696e73756666696369656e742062616c616e636520666f722063616c, mem[366 len 26]
  if not ext_code.size(tokenAddress):
      revert with 0, 'Address: call to non-contract'
  mem[260 len 64] = transfer(address to, uint256 tokens), addr(_param2) << 64, 0, Mask(224, 32, userData[addr(_param1)].field_0 - userData[addr(_param1)].field_256) >> 32
  mem[324 len 0] = 0
  call tokenAddress with:
       gas gas_remaining wei
      args Mask(224, 32, userData[addr(_param1)].field_0 - userData[addr(_param1)].field_256) << 224, mem[324 len 4]
  if not return_data.size:
      if not ext_call.success:
          revert with transfer(address to, uint256 tokens), 
                      addr(_param2) << 64,
                      0,
                      userData[addr(_param1)].field_0 - userData[addr(_param1)].field_256
      if not transfer(address to, uint256 tokens), addr(_param2) << 64:
          revert with 0, 32, 42, 0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565, mem[370 len 22]
  else:
      mem[292 len return_data.size] = ext_call.return_data[0 len return_data.size]
      if not ext_call.success:
          if return_data.size:
              revert with ext_call.return_data[0 len return_data.size]
          revert with 0, 'SafeERC20: low-level call failed'
      if return_data.size:
          require return_data.size >= 32
          if not mem[292]:
              revert with 0, 
                          32,
                          42,
                          0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565,
                          mem[ceil32(return_data.size) + 371 len 22]

def getReleasableAmount(address _param1) payable: 
  require calldata.size - 4 >= 32
  if block.timestamp < start:
      if userData[addr(_param1)].field_256 > 0:
          revert with 0, 'SafeMath: subtraction overflow'
      return -userData[addr(_param1)].field_256
  if block.timestamp >= finish:
      if userData[addr(_param1)].field_256 > userData[addr(_param1)].field_0:
          revert with 0, 'SafeMath: subtraction overflow'
      return (userData[addr(_param1)].field_0 - userData[addr(_param1)].field_256)
  if start > block.timestamp:
      revert with 0, 'SafeMath: subtraction overflow'
  idx = 0
  s = 0
  t = block.timestamp - start
  while idx < unknown3e79dafa.length:
      if t < unknown3e79dafa[idx]:
          if not userData[addr(_param1)].field_0:
              if userData[addr(_param1)].field_256 > 0:
                  revert with 0, 'SafeMath: subtraction overflow'
              return -userData[addr(_param1)].field_256
          if s * userData[addr(_param1)].field_0 / userData[addr(_param1)].field_0 != s:
              revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                          32,
                          33,
                          0x21536166654d6174683a206d756c7469706c69636174696f6e206f766572666c6f,
                          mem[197 len 31]
          if userData[addr(_param1)].field_256 > s * userData[addr(_param1)].field_0 / 10000:
              revert with 0, 'SafeMath: subtraction overflow'
          return ((s * userData[addr(_param1)].field_0 / 10000) - userData[addr(_param1)].field_256)
      require idx < unknown8aa71faa.length
      _41 = sha3(4)
      if unknown8aa71faa[idx] + s < s:
          revert with 0, 'SafeMath: addition overflow'
      require idx < unknown3e79dafa.length
      mem[0] = 3
      if unknown3e79dafa[idx] > t:
          revert with 0, 'SafeMath: subtraction overflow'
      idx = idx + 1
      s = unknown8aa71faa[idx] + s
      t = t - unknown3e79dafa[idx]
      continue 
  if not userData[addr(_param1)].field_0:
      if userData[addr(_param1)].field_256 > 0:
          revert with 0, 'SafeMath: subtraction overflow'
      return -userData[addr(_param1)].field_256
  if stor[_41 + stor3.length] * unknown3e79dafa.length * userData[addr(_param1)].field_0 / userData[addr(_param1)].field_0 != stor[_41 + stor3.length] * unknown3e79dafa.length:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                  32,
                  33,
                  0x21536166654d6174683a206d756c7469706c69636174696f6e206f766572666c6f,
                  mem[197 len 31]
  if userData[addr(_param1)].field_256 > stor[_41 + stor3.length] * unknown3e79dafa.length * userData[addr(_param1)].field_0 / 10000:
      revert with 0, 'SafeMath: subtraction overflow'
  return ((stor[_41 + stor3.length] * unknown3e79dafa.length * userData[addr(_param1)].field_0 / 10000) - userData[addr(_param1)].field_256)

def unknown84304ad7() payable: 
  require calldata.size - 4 >= 128
  require cd <= 4294967296
  require cd <= calldata.size
  require ('cd', 36).length <= 4294967296 and cd * ('cd', 36).length) + 36 <= calldata.size
  require cd <= 4294967296
  require cd <= calldata.size
  require ('cd', 68).length <= 4294967296 and cd * ('cd', 68).length) + 36 <= calldata.size
  if cd <= block.timestamp:
      revert with 0, 'Vesting: should start in future'
  if ('cd', 68).length != ('cd', 36).length:
      revert with 0, 'Vesting: Unequal arrays!'
  if not ('cd', 68).length:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                  32,
                  37,
                  0x2156657374696e673a20496e636f6d70617469626c652070657263656e747320636f756e74,
                  mem[201 len 27]
  if ('cd', 68).length >= 12:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                  32,
                  37,
                  0x2156657374696e673a20496e636f6d70617469626c652070657263656e747320636f756e74,
                  mem[201 len 27]
  idx = 0
  s = 0
  while idx < ('cd', 68).length:
      if cd[((32 * idx) + cds < s:
          revert with 0, 'SafeMath: addition overflow'
      idx = idx + 1
      s = cd[((32 * idx) + cds
      continue 
  if cd[((32 * ('cd', 68).length) + cd * ('cd', 68).length != 10000:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                  32,
                  75,
                  0xfe56657374696e673a2054686520746f74616c2070657263656e74206f6620616c6c2072656c6561736573206973206e6f7420657175616c20746f2068756e647265642070657263656e74,
                  mem[239 len 21]
  start = cd[4]
  hasInitialized = 1
  tokenAddress = addr(cd)
  stor6 = 0
  unknown3e79dafa.length = ('cd', 36).length
  if not ('cd', 36).length:
      idx = 0
      while unknown3e79dafa.length > idx:
          unknown3e79dafa[idx] = 0
          idx = idx + 1
          continue 
  else:
      s = 0
      idx = cd[36] + 36
      while cd * ('cd', 36).length) + 36 > idx:
          unknown3e79dafa[s] = cd[idx]
          s = s + 1
          idx = idx + 32
          continue 
      idx = Mask(251, 0, (32 * ('cd', 36).length) + 31) >> 5
      while unknown3e79dafa.length > idx:
          unknown3e79dafa[idx] = 0
          idx = idx + 1
          continue 
  unknown8aa71faa.length = ('cd', 68).length
  if not ('cd', 68).length:
      idx = 0
      while unknown8aa71faa.length > idx:
          unknown8aa71faa[idx] = 0
          idx = idx + 1
          continue 
  else:
      s = 0
      idx = cd[68] + 36
      while cd * ('cd', 68).length) + 36 > idx:
          unknown8aa71faa[s] = cd[idx]
          s = s + 1
          idx = idx + 32
          continue 
      idx = Mask(251, 0, (32 * ('cd', 68).length) + 31) >> 5
      while unknown8aa71faa.length > idx:
          unknown8aa71faa[idx] = 0
          idx = idx + 1
          continue 
  idx = 0
  s = 0
  while idx < ('cd', 36).length:
      if cd[((32 * idx) + cds < s:
          revert with 0, 'SafeMath: addition overflow'
      idx = idx + 1
      s = cd[((32 * idx) + cds
      continue 
  if (cd[((32 * ('cd', 36).length) + cd * ('cd', 36).length) + start < start:
      revert with 0, 'SafeMath: addition overflow'
  finish = (cd[((32 * ('cd', 36).length) + cd * ('cd', 36).length) + start
  if not caller:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                  32,
                  38,
                  0x214f776e61626c653a206e6577206f776e657220697320746865207a65726f20616464726573,
                  mem[202 len 26]
  log OwnershipTransferred(
        address previousOwner=owner,
        address newOwner=caller)
  owner = caller

def release(address _address) payable: 
  mem[64] = 96
  require calldata.size - 4 >= 32
  if owner != caller:
      revert with 0, 'wOwnable: caller is not the owne'
  if not userData[addr(_address)].field_0:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                  32,
                  45,
                  0x216f6e6c7957686974656c69737465643a205265636569766572206973206e6f742077686974656c6973746564,
                  mem[209 len 19]
  if paused:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                  32,
                  35,
                  0x2172656c656173653a20436c61696d696e6720746f6b656e7320697320706175736564,
                  mem[199 len 29]
  mem[0] = _address
  mem[32] = 7
  if block.timestamp < start:
      if userData[addr(_address)].field_256 > 0:
          revert with 0, 'SafeMath: subtraction overflow'
      if -userData[addr(_address)].field_256 <= 0:
          revert with 0, 'release: no tokens are due'
      if 0 < userData[addr(_address)].field_256:
          revert with 0, 'SafeMath: addition overflow'
      userData[addr(_address)].field_256 = 0
      if eth.balance(this.address) < 0:
          revert with 0, 32, 38, 0x73416464726573733a20696e73756666696369656e742062616c616e636520666f722063616c, mem[366 len 26]
      if not ext_code.size(tokenAddress):
          revert with 0, 'Address: call to non-contract'
      mem[260 len 64] = transfer(address to, uint256 tokens), addr(_address) << 64, 0, Mask(224, 32, -userData[addr(_address)].field_256) >> 32
  else:
      if block.timestamp >= finish:
          if userData[addr(_address)].field_256 > userData[addr(_address)].field_0:
              revert with 0, 'SafeMath: subtraction overflow'
          if userData[addr(_address)].field_0 - userData[addr(_address)].field_256 <= 0:
              revert with 0, 'release: no tokens are due'
          if userData[addr(_address)].field_0 < userData[addr(_address)].field_256:
              revert with 0, 'SafeMath: addition overflow'
          userData[addr(_address)].field_256 = userData[addr(_address)].field_0
          if eth.balance(this.address) < 0:
              revert with 0, 32, 38, 0x73416464726573733a20696e73756666696369656e742062616c616e636520666f722063616c, mem[366 len 26]
          if not ext_code.size(tokenAddress):
              revert with 0, 'Address: call to non-contract'
          mem[260 len 64] = transfer(address to, uint256 tokens), addr(_address) << 64, 0, Mask(224, 32, userData[addr(_address)].field_0 - userData[addr(_address)].field_256) >> 32
          call tokenAddress with:
               gas gas_remaining wei
              args Mask(224, 32, userData[addr(_address)].field_0 - userData[addr(_address)].field_256) << 224, mem[324 len 4]
          if not return_data.size:
              if not ext_call.success:
                  revert with transfer(address to, uint256 tokens), 
                              addr(_address) << 64,
                              0,
                              userData[addr(_address)].field_0 - userData[addr(_address)].field_256
              if not transfer(address to, uint256 tokens), addr(_address) << 64:
                  revert with 0, 32, 42, 0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565, mem[370 len 22]
          else:
              mem[292 len return_data.size] = ext_call.return_data[0 len return_data.size]
              if not ext_call.success:
                  if return_data.size:
                      revert with ext_call.return_data[0 len return_data.size]
                  revert with 0, 'SafeERC20: low-level call failed'
              if return_data.size:
                  require return_data.size >= 32
                  if not mem[292]:
                      revert with 0, 
                                  32,
                                  42,
                                  0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565,
                                  mem[ceil32(return_data.size) + 371 len 22]
          return (userData[addr(_address)].field_0 - userData[addr(_address)].field_256)
      if start > block.timestamp:
          revert with 0, 'SafeMath: subtraction overflow'
      idx = 0
      s = 0
      t = block.timestamp - start
      while idx < unknown3e79dafa.length:
          if t >= unknown3e79dafa[idx]:
              require idx < unknown8aa71faa.length
              if unknown8aa71faa[idx] + s < s:
                  revert with 0, 'SafeMath: addition overflow'
              require idx < unknown3e79dafa.length
              mem[0] = 3
              if unknown3e79dafa[idx] > t:
                  revert with 0, 'SafeMath: subtraction overflow'
              idx = idx + 1
              s = unknown8aa71faa[idx] + s
              t = t - unknown3e79dafa[idx]
              continue 
          if not userData[addr(_address)].field_0:
              if userData[addr(_address)].field_256 > 0:
                  revert with 0, 'SafeMath: subtraction overflow'
              if -userData[addr(_address)].field_256 <= 0:
                  revert with 0, 'release: no tokens are due'
              if 0 < userData[addr(_address)].field_256:
                  revert with 0, 'SafeMath: addition overflow'
              mem[0] = _address
              mem[32] = 7
              userData[addr(_address)].field_256 = 0
              mem[132] = _address
              mem[164] = -userData[addr(_address)].field_256
              mem[96] = 68
              mem[128] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000 or addr(_address) << 64
              mem[64] = 260
              mem[196] = 32
              mem[228] = 'SafeERC20: low-level call failed'
              if eth.balance(this.address) < 0:
                  revert with 0, 32, 38, 0x73416464726573733a20696e73756666696369656e742062616c616e636520666f722063616c, mem[366 len 26]
              if not ext_code.size(tokenAddress):
                  revert with 0, 'Address: call to non-contract'
              s = 128
              t = mem[64]
              idx = mem[96]
              while idx >= 32:
                  mem[t] = mem[s]
                  s = s + 32
                  t = t + 32
                  idx = idx - 32
                  continue 
              mem[mem[64] + floor32(mem[96])] = mem[floor32(mem[96]) + -(mem[96] % 32) + 160 len mem[96] % 32] or Mask(8 * -(mem[96] % 32) + 32, -(8 * -(mem[96] % 32) + 32) + 256, mem[mem[64] + floor32(mem[96])])
              call tokenAddress.mem[mem[64] len 4] with:
                   gas gas_remaining wei
                  args mem[mem[64] + 4 len -mem[64] + 324]
              if not return_data.size:
                  if ext_call.success:
                      if mem[96]:
                          require mem[96] >= 32
                          if not mem[128]:
                              revert with 0, 
                                          32,
                                          42,
                                          0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565,
                                          mem[mem[64] + 110 len 22]
                      return -userData[addr(_address)].field_256
                  if mem[96]:
                      revert with memory
                        from 128
                         len mem[96]
                  _776 = mem[64]
                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                  mem[mem[64] + 4] = 32
                  mem[mem[64] + 36] = mem[196]
                  _778 = mem[196]
                  idx = 0
                  while idx < _778:
                      mem[idx + _776 + 68] = mem[idx + 228]
                      idx = idx + 32
                      continue 
                  if not _778 % 32:
                      revert with memory
                        from mem[64]
                         len _778 + _776 + -mem[64] + 68
                  mem[floor32(_778) + _776 + 68] = mem[floor32(_778) + _776 + -(_778 % 32) + 100 len _778 % 32]
                  revert with memory
                    from mem[64]
                     len floor32(_778) + _776 + -mem[64] + 100
              _731 = mem[64]
              mem[64] = mem[64] + ceil32(return_data.size) + 1
              mem[_731] = return_data.size
              mem[_731 + 32 len return_data.size] = ext_call.return_data[0 len return_data.size]
              if ext_call.success:
                  if return_data.size:
                      require return_data.size >= 32
                      if not mem[_731 + 32]:
                          revert with 0, 
                                      32,
                                      42,
                                      0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565,
                                      mem[mem[64] + 110 len 22]
                  return -userData[addr(_address)].field_256
              if return_data.size:
                  revert with ext_call.return_data[0 len return_data.size]
              _780 = mem[64]
              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
              mem[mem[64] + 4] = 32
              mem[mem[64] + 36] = mem[196]
              _782 = mem[196]
              idx = 0
              while idx < _782:
                  mem[idx + _780 + 68] = mem[idx + 228]
                  idx = idx + 32
                  continue 
              if not _782 % 32:
                  revert with memory
                    from mem[64]
                     len _782 + _780 + -mem[64] + 68
              mem[floor32(_782) + _780 + 68] = mem[floor32(_782) + _780 + -(_782 % 32) + 100 len _782 % 32]
              revert with memory
                from mem[64]
                 len floor32(_782) + _780 + -mem[64] + 100
          if s * userData[addr(_address)].field_0 / userData[addr(_address)].field_0 != s:
              revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                          32,
                          33,
                          0x21536166654d6174683a206d756c7469706c69636174696f6e206f766572666c6f,
                          mem[197 len 31]
          if userData[addr(_address)].field_256 > s * userData[addr(_address)].field_0 / 10000:
              revert with 0, 'SafeMath: subtraction overflow'
          if (s * userData[addr(_address)].field_0 / 10000) - userData[addr(_address)].field_256 <= 0:
              revert with 0, 'release: no tokens are due'
          if s * userData[addr(_address)].field_0 / 10000 < userData[addr(_address)].field_256:
              revert with 0, 'SafeMath: addition overflow'
          mem[0] = _address
          mem[32] = 7
          userData[addr(_address)].field_256 = s * userData[addr(_address)].field_0 / 10000
          mem[132] = _address
          mem[164] = (s * userData[addr(_address)].field_0 / 10000) - userData[addr(_address)].field_256
          mem[96] = 68
          mem[128] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000 or addr(_address) << 64
          mem[64] = 260
          mem[196] = 32
          mem[228] = 'SafeERC20: low-level call failed'
          if eth.balance(this.address) < 0:
              revert with 0, 32, 38, 0x73416464726573733a20696e73756666696369656e742062616c616e636520666f722063616c, mem[366 len 26]
          if not ext_code.size(tokenAddress):
              revert with 0, 'Address: call to non-contract'
          t = 128
          u = mem[64]
          idx = mem[96]
          while idx >= 32:
              mem[u] = mem[t]
              t = t + 32
              u = u + 32
              idx = idx - 32
              continue 
          mem[mem[64] + floor32(mem[96])] = mem[floor32(mem[96]) + -(mem[96] % 32) + 160 len mem[96] % 32] or Mask(8 * -(mem[96] % 32) + 32, -(8 * -(mem[96] % 32) + 32) + 256, mem[mem[64] + floor32(mem[96])])
          call tokenAddress.mem[mem[64] len 4] with:
               gas gas_remaining wei
              args mem[mem[64] + 4 len -mem[64] + 324]
          if not return_data.size:
              if ext_call.success:
                  if mem[96]:
                      require mem[96] >= 32
                      if not mem[128]:
                          revert with 0, 
                                      32,
                                      42,
                                      0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565,
                                      mem[mem[64] + 110 len 22]
                  return ((s * userData[addr(_address)].field_0 / 10000) - userData[addr(_address)].field_256)
              if mem[96]:
                  revert with memory
                    from 128
                     len mem[96]
              _768 = mem[64]
              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
              mem[mem[64] + 4] = 32
              mem[mem[64] + 36] = mem[196]
              _770 = mem[196]
              idx = 0
              while idx < _770:
                  mem[idx + _768 + 68] = mem[idx + 228]
                  idx = idx + 32
                  continue 
              if not _770 % 32:
                  revert with memory
                    from mem[64]
                     len _770 + _768 + -mem[64] + 68
              mem[floor32(_770) + _768 + 68] = mem[floor32(_770) + _768 + -(_770 % 32) + 100 len _770 % 32]
              revert with memory
                from mem[64]
                 len floor32(_770) + _768 + -mem[64] + 100
          _730 = mem[64]
          mem[64] = mem[64] + ceil32(return_data.size) + 1
          mem[_730] = return_data.size
          mem[_730 + 32 len return_data.size] = ext_call.return_data[0 len return_data.size]
          if ext_call.success:
              if return_data.size:
                  require return_data.size >= 32
                  if not mem[_730 + 32]:
                      revert with 0, 
                                  32,
                                  42,
                                  0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565,
                                  mem[mem[64] + 110 len 22]
              return ((s * userData[addr(_address)].field_0 / 10000) - userData[addr(_address)].field_256)
          if return_data.size:
              revert with ext_call.return_data[0 len return_data.size]
          _772 = mem[64]
          mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
          mem[mem[64] + 4] = 32
          mem[mem[64] + 36] = mem[196]
          _774 = mem[196]
          idx = 0
          while idx < _774:
              mem[idx + _772 + 68] = mem[idx + 228]
              idx = idx + 32
              continue 
          if not _774 % 32:
              revert with memory
                from mem[64]
                 len _774 + _772 + -mem[64] + 68
          mem[floor32(_774) + _772 + 68] = mem[floor32(_774) + _772 + -(_774 % 32) + 100 len _774 % 32]
          revert with memory
            from mem[64]
             len floor32(_774) + _772 + -mem[64] + 100
      if userData[addr(_address)].field_0:
          if s * userData[addr(_address)].field_0 / userData[addr(_address)].field_0 != s:
              revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                          32,
                          33,
                          0x21536166654d6174683a206d756c7469706c69636174696f6e206f766572666c6f,
                          mem[197 len 31]
          if userData[addr(_address)].field_256 > s * userData[addr(_address)].field_0 / 10000:
              revert with 0, 'SafeMath: subtraction overflow'
          if (s * userData[addr(_address)].field_0 / 10000) - userData[addr(_address)].field_256 <= 0:
              revert with 0, 'release: no tokens are due'
          if s * userData[addr(_address)].field_0 / 10000 < userData[addr(_address)].field_256:
              revert with 0, 'SafeMath: addition overflow'
          userData[addr(_address)].field_256 = s * userData[addr(_address)].field_0 / 10000
          if eth.balance(this.address) < 0:
              revert with 0, 32, 38, 0x73416464726573733a20696e73756666696369656e742062616c616e636520666f722063616c, mem[366 len 26]
          if not ext_code.size(tokenAddress):
              revert with 0, 'Address: call to non-contract'
          mem[260 len 64] = transfer(address to, uint256 tokens), addr(_address) << 64, 0, Mask(224, 32, (s * userData[addr(_address)].field_0 / 10000) - userData[addr(_address)].field_256) >> 32
          call tokenAddress with:
               gas gas_remaining wei
              args Mask(224, 32, (s * userData[addr(_address)].field_0 / 10000) - userData[addr(_address)].field_256) << 224, mem[324 len 4]
          if not return_data.size:
              if not ext_call.success:
                  revert with transfer(address to, uint256 tokens), 
                              addr(_address) << 64,
                              0,
                              (s * userData[addr(_address)].field_0 / 10000) - userData[addr(_address)].field_256
              if not transfer(address to, uint256 tokens), addr(_address) << 64:
                  revert with 0, 32, 42, 0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565, mem[370 len 22]
          else:
              mem[292 len return_data.size] = ext_call.return_data[0 len return_data.size]
              if not ext_call.success:
                  if return_data.size:
                      revert with ext_call.return_data[0 len return_data.size]
                  revert with 0, 'SafeERC20: low-level call failed'
              if return_data.size:
                  require return_data.size >= 32
                  if not mem[292]:
                      revert with 0, 
                                  32,
                                  42,
                                  0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565,
                                  mem[ceil32(return_data.size) + 371 len 22]
          return ((s * userData[addr(_address)].field_0 / 10000) - userData[addr(_address)].field_256)
      if userData[addr(_address)].field_256 > 0:
          revert with 0, 'SafeMath: subtraction overflow'
      if -userData[addr(_address)].field_256 <= 0:
          revert with 0, 'release: no tokens are due'
      if 0 < userData[addr(_address)].field_256:
          revert with 0, 'SafeMath: addition overflow'
      userData[addr(_address)].field_256 = 0
      if eth.balance(this.address) < 0:
          revert with 0, 32, 38, 0x73416464726573733a20696e73756666696369656e742062616c616e636520666f722063616c, mem[366 len 26]
      if not ext_code.size(tokenAddress):
          revert with 0, 'Address: call to non-contract'
      mem[260 len 64] = transfer(address to, uint256 tokens), addr(_address) << 64, 0, Mask(224, 32, -userData[addr(_address)].field_256) >> 32
      mem[324 len 0] = 0
  call tokenAddress with:
       gas gas_remaining wei
      args Mask(224, 32, -userData[addr(_address)].field_256) << 224, mem[324 len 4]
  if not return_data.size:
      if not ext_call.success:
          revert with transfer(address to, uint256 tokens), addr(_address) << 64, 0, -userData[addr(_address)].field_256
      if not transfer(address to, uint256 tokens), addr(_address) << 64:
          revert with 0, 32, 42, 0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565, mem[370 len 22]
  else:
      mem[292 len return_data.size] = ext_call.return_data[0 len return_data.size]
      if not ext_call.success:
          if return_data.size:
              revert with ext_call.return_data[0 len return_data.size]
          revert with 0, 'SafeERC20: low-level call failed'
      if return_data.size:
          require return_data.size >= 32
          if not mem[292]:
              revert with 0, 
                          32,
                          42,
                          0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565,
                          mem[ceil32(return_data.size) + 371 len 22]
  return -userData[addr(_address)].field_256

def unknown48af088b() payable: 
  require calldata.size - 4 >= 32
  require cd <= 4294967296
  require cd <= calldata.size
  require ('cd', 4).length <= 4294967296 and cd * ('cd', 4).length) + 36 <= calldata.size
  if owner != caller:
      revert with 0, 'wOwnable: caller is not the owne'
  if paused:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                  32,
                  39,
                  0x6c6d61737352656c656173653a20436c61696d696e6720746f6b656e7320697320706175736564,
                  mem[203 len 25]
  require ('cd', 4).length <= 18446744073709551615
  mem[96] = ('cd', 4).length
  mem[64] = (32 * ('cd', 4).length) + 128
  if not ('cd', 4).length:
      idx = 0
      while idx < ('cd', 4).length:
          if userData[addr(cd[((32 * idx) + cd)].field_0 <= 0:
              revert with 0, 
                          32,
                          48,
                          0x646d61737352656c656173653a20536f6d652072656365697665727320617265206e6f742077686974656c6973746564,
                          mem[mem[64] + 116 len 16]
          mem[0] = addr(cd[((32 * idx) + cd)
          mem[32] = 7
          if block.timestamp < start:
              if userData[addr(cd[((32 * idx) + cd)].field_256 > 0:
                  revert with 0, 'SafeMath: subtraction overflow'
              require idx < mem[96]
              mem[(32 * idx) + 128] = -userData[addr(cd[((32 * idx) + cd)].field_256
              if not -userData[addr(cd[((32 * idx) + cd)].field_256:
                  idx = idx + 1
                  continue 
              if 0 < userData[addr(cd[((32 * idx) + cd)].field_256:
                  revert with 0, 'SafeMath: addition overflow'
              mem[0] = addr(cd[((32 * idx) + cd)
              mem[32] = 7
              userData[addr(cd[((32 * idx) + cd)].field_256 = 0
              _720 = mem[64]
              mem[mem[64] + 36] = addr(cd[((32 * idx) + cd)
              mem[mem[64] + 68] = -userData[addr(cd[((32 * idx) + cd)].field_256
              _721 = mem[64]
              mem[mem[64]] = 68
              mem[64] = mem[64] + 100
              mem[_721 + 32] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000 or mem[_721 + 36 len 28]
              mem[64] = _720 + 164
              mem[_720 + 100] = 32
              mem[_720 + 132] = 'SafeERC20: low-level call failed'
              if eth.balance(this.address) < 0:
                  revert with 0, 32, 38, 0x73416464726573733a20696e73756666696369656e742062616c616e636520666f722063616c, mem[_720 + 270 len 26]
              if not ext_code.size(tokenAddress):
                  revert with 0, 'Address: call to non-contract'
              _761 = mem[_721]
              t = _721 + 32
              u = _720 + 164
              s = mem[_721]
              while s >= 32:
                  mem[u] = mem[t]
                  t = t + 32
                  u = u + 32
                  s = s - 32
                  continue 
              mem[_720 + floor32(mem[_721]) + 164] = mem[_721 + -(mem[_721] % 32) + floor32(mem[_721]) + 64 len mem[_721] % 32] or Mask(8 * -(mem[_721] % 32) + 32, -(8 * -(mem[_721] % 32) + 32) + 256, mem[_720 + floor32(mem[_721]) + 164])
              call tokenAddress.mem[_720 + 164 len 4] with:
                   gas gas_remaining wei
                  args mem[_720 + 168 len _761 - 4]
              if not return_data.size:
                  if ext_call.success:
                      if mem[96]:
                          require mem[96] >= 32
                          if not mem[128]:
                              revert with 0, 
                                          32,
                                          42,
                                          0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565,
                                          mem[_720 + 274 len 22]
                      idx = idx + 1
                      continue 
                  if mem[96]:
                      revert with memory
                        from 128
                         len mem[96]
                  mem[_720 + 164] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                  mem[_720 + 168] = 32
                  mem[_720 + 200] = 32
                  idx = 0
                  while idx < 32:
                      mem[idx + _720 + 232] = mem[idx + _720 + 132]
                      idx = idx + 32
                      continue 
                  revert with memory
                    from mem[64]
                     len _720 + -mem[64] + 264
              mem[64] = _720 + ceil32(return_data.size) + 165
              mem[_720 + 164] = return_data.size
              mem[_720 + 196 len return_data.size] = ext_call.return_data[0 len return_data.size]
              if ext_call.success:
                  if return_data.size:
                      require return_data.size >= 32
                      if not mem[_720 + 196]:
                          revert with 0, 
                                      32,
                                      42,
                                      0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565,
                                      mem[_720 + ceil32(return_data.size) + 275 len 22]
                  idx = idx + 1
                  continue 
              if return_data.size:
                  revert with ext_call.return_data[0 len return_data.size]
              mem[_720 + ceil32(return_data.size) + 165] = 0x8c379a000000000000000000000000000000000000000000000000000000000
              mem[_720 + ceil32(return_data.size) + 169] = 32
              idx = 0
              while idx < 32:
                  mem[idx + _720 + ceil32(return_data.size) + 233] = mem[idx + _720 + 132]
                  idx = idx + 32
                  continue 
              revert with 0, 32, 32, mem[_720 + ceil32(return_data.size) + 233]
          if block.timestamp >= finish:
              if userData[addr(cd[((32 * idx) + cd)].field_256 > userData[addr(cd[((32 * idx) + cd)].field_0:
                  revert with 0, 'SafeMath: subtraction overflow'
              require idx < mem[96]
              mem[(32 * idx) + 128] = userData[addr(cd[((32 * idx) + cd)].field_0 - userData[addr(cd[((32 * idx) + cd)].field_256
              if not userData[addr(cd[((32 * idx) + cd)].field_0 - userData[addr(cd[((32 * idx) + cd)].field_256:
                  idx = idx + 1
                  continue 
              if userData[addr(cd[((32 * idx) + cd)].field_0 < userData[addr(cd[((32 * idx) + cd)].field_256:
                  revert with 0, 'SafeMath: addition overflow'
              mem[0] = addr(cd[((32 * idx) + cd)
              mem[32] = 7
              userData[addr(cd[((32 * idx) + cd)].field_256 = userData[addr(cd[((32 * idx) + cd)].field_0
              _730 = mem[64]
              mem[mem[64] + 36] = addr(cd[((32 * idx) + cd)
              mem[mem[64] + 68] = userData[addr(cd[((32 * idx) + cd)].field_0 - userData[addr(cd[((32 * idx) + cd)].field_256
              _731 = mem[64]
              mem[mem[64]] = 68
              mem[64] = mem[64] + 100
              mem[_731 + 32] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000 or mem[_731 + 36 len 28]
              mem[64] = _730 + 164
              mem[_730 + 100] = 32
              mem[_730 + 132] = 'SafeERC20: low-level call failed'
              if eth.balance(this.address) < 0:
                  revert with 0, 32, 38, 0x73416464726573733a20696e73756666696369656e742062616c616e636520666f722063616c, mem[_730 + 270 len 26]
              if not ext_code.size(tokenAddress):
                  revert with 0, 'Address: call to non-contract'
              _772 = mem[_731]
              t = _731 + 32
              u = mem[64]
              s = mem[_731]
              while s >= 32:
                  mem[u] = mem[t]
                  t = t + 32
                  u = u + 32
                  s = s - 32
                  continue 
              mem[mem[64] + floor32(mem[_731])] = mem[_731 + floor32(mem[_731]) + -(mem[_731] % 32) + 64 len mem[_731] % 32] or Mask(8 * -(mem[_731] % 32) + 32, -(8 * -(mem[_731] % 32) + 32) + 256, mem[mem[64] + floor32(mem[_731])])
              call tokenAddress.mem[mem[64] len 4] with:
                   gas gas_remaining wei
                  args mem[mem[64] + 4 len _772 + _730 + -mem[64] + 160]
              if not return_data.size:
                  if ext_call.success:
                      if mem[96]:
                          require mem[96] >= 32
                          if not mem[128]:
                              revert with 0, 
                                          32,
                                          42,
                                          0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565,
                                          mem[mem[64] + 110 len 22]
                      idx = idx + 1
                      continue 
                  if mem[96]:
                      revert with memory
                        from 128
                         len mem[96]
                  _1342 = mem[64]
                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                  mem[mem[64] + 4] = 32
                  mem[mem[64] + 36] = mem[_730 + 100]
                  _1344 = mem[_730 + 100]
                  idx = 0
                  while idx < _1344:
                      mem[idx + _1342 + 68] = mem[idx + _730 + 132]
                      idx = idx + 32
                      continue 
                  if not _1344 % 32:
                      revert with memory
                        from mem[64]
                         len _1344 + _1342 + -mem[64] + 68
                  mem[floor32(_1344) + _1342 + 68] = mem[floor32(_1344) + _1342 + -(_1344 % 32) + 100 len _1344 % 32]
                  revert with memory
                    from mem[64]
                     len floor32(_1344) + _1342 + -mem[64] + 100
              _1321 = mem[64]
              mem[64] = mem[64] + ceil32(return_data.size) + 1
              mem[_1321] = return_data.size
              mem[_1321 + 32 len return_data.size] = ext_call.return_data[0 len return_data.size]
              if ext_call.success:
                  if return_data.size:
                      require return_data.size >= 32
                      if not mem[_1321 + 32]:
                          revert with 0, 
                                      32,
                                      42,
                                      0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565,
                                      mem[mem[64] + 110 len 22]
                  idx = idx + 1
                  continue 
              if return_data.size:
                  revert with ext_call.return_data[0 len return_data.size]
              _1346 = mem[64]
              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
              mem[mem[64] + 4] = 32
              mem[mem[64] + 36] = mem[_730 + 100]
              _1348 = mem[_730 + 100]
              idx = 0
              while idx < _1348:
                  mem[idx + _1346 + 68] = mem[idx + _730 + 132]
                  idx = idx + 32
                  continue 
              if not _1348 % 32:
                  revert with memory
                    from mem[64]
                     len _1348 + _1346 + -mem[64] + 68
              mem[floor32(_1348) + _1346 + 68] = mem[floor32(_1348) + _1346 + -(_1348 % 32) + 100 len _1348 % 32]
              revert with memory
                from mem[64]
                 len floor32(_1348) + _1346 + -mem[64] + 100
          if start > block.timestamp:
              revert with 0, 'SafeMath: subtraction overflow'
          s = 0
          t = 0
          u = block.timestamp - start
          while s < unknown3e79dafa.length:
              mem[0] = 3
              if u >= unknown3e79dafa[s]:
                  require s < unknown8aa71faa.length
                  if unknown8aa71faa[s] + t < t:
                      revert with 0, 'SafeMath: addition overflow'
                  require s < unknown3e79dafa.length
                  mem[0] = 3
                  if unknown3e79dafa[s] > u:
                      revert with 0, 'SafeMath: subtraction overflow'
                  s = s + 1
                  t = unknown8aa71faa[s] + t
                  u = u - unknown3e79dafa[s]
                  continue 
              if not userData[addr(cd[((32 * idx) + cd)].field_0:
                  if userData[addr(cd[((32 * idx) + cd)].field_256 > 0:
                      revert with 0, 'SafeMath: subtraction overflow'
                  require idx < mem[96]
                  mem[(32 * idx) + 128] = -userData[addr(cd[((32 * idx) + cd)].field_256
                  if not -userData[addr(cd[((32 * idx) + cd)].field_256:
                      idx = idx + 1
                      continue 
                  if 0 < userData[addr(cd[((32 * idx) + cd)].field_256:
                      revert with 0, 'SafeMath: addition overflow'
                  mem[0] = addr(cd[((32 * idx) + cd)
                  mem[32] = 7
                  userData[addr(cd[((32 * idx) + cd)].field_256 = 0
                  _1529 = mem[64]
                  mem[mem[64] + 36] = addr(cd[((32 * idx) + cd)
                  mem[mem[64] + 68] = -userData[addr(cd[((32 * idx) + cd)].field_256
                  _1530 = mem[64]
                  mem[mem[64]] = 68
                  mem[64] = mem[64] + 100
                  mem[_1530 + 32] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000 or mem[_1530 + 36 len 28]
                  mem[64] = _1529 + 164
                  mem[_1529 + 100] = 32
                  mem[_1529 + 132] = 'SafeERC20: low-level call failed'
                  if eth.balance(this.address) < 0:
                      revert with 0, 32, 38, 0x73416464726573733a20696e73756666696369656e742062616c616e636520666f722063616c, mem[_1529 + 270 len 26]
                  if not ext_code.size(tokenAddress):
                      revert with 0, 'Address: call to non-contract'
                  _1592 = mem[_1530]
                  t = _1530 + 32
                  u = mem[64]
                  s = mem[_1530]
                  while s >= 32:
                      mem[u] = mem[t]
                      t = t + 32
                      u = u + 32
                      s = s - 32
                      continue 
                  mem[mem[64] + floor32(mem[_1530])] = mem[_1530 + floor32(mem[_1530]) + -(mem[_1530] % 32) + 64 len mem[_1530] % 32] or Mask(8 * -(mem[_1530] % 32) + 32, -(8 * -(mem[_1530] % 32) + 32) + 256, mem[mem[64] + floor32(mem[_1530])])
                  call tokenAddress.mem[mem[64] len 4] with:
                       gas gas_remaining wei
                      args mem[mem[64] + 4 len _1592 + _1529 + -mem[64] + 160]
                  if not return_data.size:
                      if ext_call.success:
                          if mem[96]:
                              require mem[96] >= 32
                              if not mem[128]:
                                  revert with 0, 
                                              32,
                                              42,
                                              0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565,
                                              mem[mem[64] + 110 len 22]
                          idx = idx + 1
                          continue 
                      if mem[96]:
                          revert with memory
                            from 128
                             len mem[96]
                      _1970 = mem[64]
                      mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                      mem[mem[64] + 4] = 32
                      mem[mem[64] + 36] = mem[_1529 + 100]
                      _1972 = mem[_1529 + 100]
                      idx = 0
                      while idx < _1972:
                          mem[idx + _1970 + 68] = mem[idx + _1529 + 132]
                          idx = idx + 32
                          continue 
                      if not _1972 % 32:
                          revert with memory
                            from mem[64]
                             len _1972 + _1970 + -mem[64] + 68
                      mem[floor32(_1972) + _1970 + 68] = mem[floor32(_1972) + _1970 + -(_1972 % 32) + 100 len _1972 % 32]
                      revert with memory
                        from mem[64]
                         len floor32(_1972) + _1970 + -mem[64] + 100
                  _1901 = mem[64]
                  mem[64] = mem[64] + ceil32(return_data.size) + 1
                  mem[_1901] = return_data.size
                  mem[_1901 + 32 len return_data.size] = ext_call.return_data[0 len return_data.size]
                  if ext_call.success:
                      if return_data.size:
                          require return_data.size >= 32
                          if not mem[_1901 + 32]:
                              revert with 0, 
                                          32,
                                          42,
                                          0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565,
                                          mem[mem[64] + 110 len 22]
                      idx = idx + 1
                      continue 
                  if return_data.size:
                      revert with ext_call.return_data[0 len return_data.size]
                  _1974 = mem[64]
                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                  mem[mem[64] + 4] = 32
                  mem[mem[64] + 36] = mem[_1529 + 100]
                  _1976 = mem[_1529 + 100]
                  idx = 0
                  while idx < _1976:
                      mem[idx + _1974 + 68] = mem[idx + _1529 + 132]
                      idx = idx + 32
                      continue 
                  if not _1976 % 32:
                      revert with memory
                        from mem[64]
                         len _1976 + _1974 + -mem[64] + 68
                  mem[floor32(_1976) + _1974 + 68] = mem[floor32(_1976) + _1974 + -(_1976 % 32) + 100 len _1976 % 32]
                  revert with memory
                    from mem[64]
                     len floor32(_1976) + _1974 + -mem[64] + 100
              if t * userData[addr(cd[((32 * idx) + cd)].field_0 / userData[addr(cd[((32 * idx) + cd)].field_0 != t:
                  revert with 0, 32, 33, 0x21536166654d6174683a206d756c7469706c69636174696f6e206f766572666c6f, mem[mem[64] + 101 len 31]
              if userData[addr(cd[((32 * idx) + cd)].field_256 > t * userData[addr(cd[((32 * idx) + cd)].field_0 / 10000:
                  revert with 0, 'SafeMath: subtraction overflow'
              require idx < mem[96]
              mem[(32 * idx) + 128] = (t * userData[addr(cd[((32 * idx) + cd)].field_0 / 10000) - userData[addr(cd[((32 * idx) + cd)].field_256
              if not (t * userData[addr(cd[((32 * idx) + cd)].field_0 / 10000) - userData[addr(cd[((32 * idx) + cd)].field_256:
                  idx = idx + 1
                  continue 
              if t * userData[addr(cd[((32 * idx) + cd)].field_0 / 10000 < userData[addr(cd[((32 * idx) + cd)].field_256:
                  revert with 0, 'SafeMath: addition overflow'
              mem[0] = addr(cd[((32 * idx) + cd)
              mem[32] = 7
              userData[addr(cd[((32 * idx) + cd)].field_256 = t * userData[addr(cd[((32 * idx) + cd)].field_0 / 10000
              _1538 = mem[64]
              mem[mem[64] + 36] = addr(cd[((32 * idx) + cd)
              mem[mem[64] + 68] = (t * userData[addr(cd[((32 * idx) + cd)].field_0 / 10000) - userData[addr(cd[((32 * idx) + cd)].field_256
              _1539 = mem[64]
              mem[mem[64]] = 68
              mem[64] = mem[64] + 100
              mem[_1539 + 32] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000 or mem[_1539 + 36 len 28]
              mem[64] = _1538 + 164
              mem[_1538 + 100] = 32
              mem[_1538 + 132] = 'SafeERC20: low-level call failed'
              if eth.balance(this.address) < 0:
                  revert with 0, 32, 38, 0x73416464726573733a20696e73756666696369656e742062616c616e636520666f722063616c, mem[_1538 + 270 len 26]
              if not ext_code.size(tokenAddress):
                  revert with 0, 'Address: call to non-contract'
              _1606 = mem[_1539]
              t = _1539 + 32
              u = mem[64]
              s = mem[_1539]
              while s >= 32:
                  mem[u] = mem[t]
                  t = t + 32
                  u = u + 32
                  s = s - 32
                  continue 
              mem[mem[64] + floor32(mem[_1539])] = mem[_1539 + floor32(mem[_1539]) + -(mem[_1539] % 32) + 64 len mem[_1539] % 32] or Mask(8 * -(mem[_1539] % 32) + 32, -(8 * -(mem[_1539] % 32) + 32) + 256, mem[mem[64] + floor32(mem[_1539])])
              call tokenAddress.mem[mem[64] len 4] with:
                   gas gas_remaining wei
                  args mem[mem[64] + 4 len _1606 + _1538 + -mem[64] + 160]
              if not return_data.size:
                  if ext_call.success:
                      if mem[96]:
                          require mem[96] >= 32
                          if not mem[128]:
                              revert with 0, 
                                          32,
                                          42,
                                          0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565,
                                          mem[mem[64] + 110 len 22]
                      idx = idx + 1
                      continue 
                  if mem[96]:
                      revert with memory
                        from 128
                         len mem[96]
                  _1962 = mem[64]
                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                  mem[mem[64] + 4] = 32
                  mem[mem[64] + 36] = mem[_1538 + 100]
                  _1964 = mem[_1538 + 100]
                  idx = 0
                  while idx < _1964:
                      mem[idx + _1962 + 68] = mem[idx + _1538 + 132]
                      idx = idx + 32
                      continue 
                  if not _1964 % 32:
                      revert with memory
                        from mem[64]
                         len _1964 + _1962 + -mem[64] + 68
                  mem[floor32(_1964) + _1962 + 68] = mem[floor32(_1964) + _1962 + -(_1964 % 32) + 100 len _1964 % 32]
                  revert with memory
                    from mem[64]
                     len floor32(_1964) + _1962 + -mem[64] + 100
              _1900 = mem[64]
              mem[64] = mem[64] + ceil32(return_data.size) + 1
              mem[_1900] = return_data.size
              mem[_1900 + 32 len return_data.size] = ext_call.return_data[0 len return_data.size]
              if ext_call.success:
                  if return_data.size:
                      require return_data.size >= 32
                      if not mem[_1900 + 32]:
                          revert with 0, 
                                      32,
                                      42,
                                      0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565,
                                      mem[mem[64] + 110 len 22]
                  idx = idx + 1
                  continue 
              if return_data.size:
                  revert with ext_call.return_data[0 len return_data.size]
              _1966 = mem[64]
              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
              mem[mem[64] + 4] = 32
              mem[mem[64] + 36] = mem[_1538 + 100]
              _1968 = mem[_1538 + 100]
              idx = 0
              while idx < _1968:
                  mem[idx + _1966 + 68] = mem[idx + _1538 + 132]
                  idx = idx + 32
                  continue 
              if not _1968 % 32:
                  revert with memory
                    from mem[64]
                     len _1968 + _1966 + -mem[64] + 68
              mem[floor32(_1968) + _1966 + 68] = mem[floor32(_1968) + _1966 + -(_1968 % 32) + 100 len _1968 % 32]
              revert with memory
                from mem[64]
                 len floor32(_1968) + _1966 + -mem[64] + 100
          if not userData[addr(cd[((32 * idx) + cd)].field_0:
              if userData[addr(cd[((32 * idx) + cd)].field_256 > 0:
                  revert with 0, 'SafeMath: subtraction overflow'
              require idx < mem[96]
              mem[(32 * idx) + 128] = -userData[addr(cd[((32 * idx) + cd)].field_256
              if not -userData[addr(cd[((32 * idx) + cd)].field_256:
                  idx = idx + 1
                  continue 
              if 0 < userData[addr(cd[((32 * idx) + cd)].field_256:
                  revert with 0, 'SafeMath: addition overflow'
              mem[0] = addr(cd[((32 * idx) + cd)
              mem[32] = 7
              userData[addr(cd[((32 * idx) + cd)].field_256 = 0
              _1499 = mem[64]
              mem[mem[64] + 36] = addr(cd[((32 * idx) + cd)
              mem[mem[64] + 68] = -userData[addr(cd[((32 * idx) + cd)].field_256
              _1500 = mem[64]
              mem[mem[64]] = 68
              mem[64] = mem[64] + 100
              mem[_1500 + 32] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000 or mem[_1500 + 36 len 28]
              mem[64] = _1499 + 164
              mem[_1499 + 100] = 32
              mem[_1499 + 132] = 'SafeERC20: low-level call failed'
              if eth.balance(this.address) < 0:
                  revert with 0, 32, 38, 0x73416464726573733a20696e73756666696369656e742062616c616e636520666f722063616c, mem[_1499 + 270 len 26]
              if not ext_code.size(tokenAddress):
                  revert with 0, 'Address: call to non-contract'
              _1555 = mem[_1500]
              t = _1500 + 32
              u = _1499 + 164
              s = mem[_1500]
              while s >= 32:
                  mem[u] = mem[t]
                  t = t + 32
                  u = u + 32
                  s = s - 32
                  continue 
              mem[_1499 + floor32(mem[_1500]) + 164] = mem[_1500 + -(mem[_1500] % 32) + floor32(mem[_1500]) + 64 len mem[_1500] % 32] or Mask(8 * -(mem[_1500] % 32) + 32, -(8 * -(mem[_1500] % 32) + 32) + 256, mem[_1499 + floor32(mem[_1500]) + 164])
              call tokenAddress.mem[_1499 + 164 len 4] with:
                   gas gas_remaining wei
                  args mem[_1499 + 168 len _1555 - 4]
              if not return_data.size:
                  if ext_call.success:
                      if mem[96]:
                          require mem[96] >= 32
                          if not mem[128]:
                              revert with 0, 
                                          32,
                                          42,
                                          0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565,
                                          mem[_1499 + 274 len 22]
                      idx = idx + 1
                      continue 
                  if mem[96]:
                      revert with memory
                        from 128
                         len mem[96]
                  mem[_1499 + 164] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                  mem[_1499 + 168] = 32
                  mem[_1499 + 200] = 32
                  idx = 0
                  while idx < 32:
                      mem[idx + _1499 + 232] = mem[idx + _1499 + 132]
                      idx = idx + 32
                      continue 
                  revert with memory
                    from mem[64]
                     len _1499 + -mem[64] + 264
              mem[64] = _1499 + ceil32(return_data.size) + 165
              mem[_1499 + 164] = return_data.size
              mem[_1499 + 196 len return_data.size] = ext_call.return_data[0 len return_data.size]
              if ext_call.success:
                  if return_data.size:
                      require return_data.size >= 32
                      if not mem[_1499 + 196]:
                          revert with 0, 
                                      32,
                                      42,
                                      0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565,
                                      mem[_1499 + ceil32(return_data.size) + 275 len 22]
                  idx = idx + 1
                  continue 
              if return_data.size:
                  revert with ext_call.return_data[0 len return_data.size]
              mem[_1499 + ceil32(return_data.size) + 165] = 0x8c379a000000000000000000000000000000000000000000000000000000000
              mem[_1499 + ceil32(return_data.size) + 169] = 32
              idx = 0
              while idx < 32:
                  mem[idx + _1499 + ceil32(return_data.size) + 233] = mem[idx + _1499 + 132]
                  idx = idx + 32
                  continue 
              revert with 0, 32, 32, mem[_1499 + ceil32(return_data.size) + 233]
          if t * userData[addr(cd[((32 * idx) + cd)].field_0 / userData[addr(cd[((32 * idx) + cd)].field_0 != t:
              revert with 0, 32, 33, 0x21536166654d6174683a206d756c7469706c69636174696f6e206f766572666c6f, mem[mem[64] + 101 len 31]
          if userData[addr(cd[((32 * idx) + cd)].field_256 > t * userData[addr(cd[((32 * idx) + cd)].field_0 / 10000:
              revert with 0, 'SafeMath: subtraction overflow'
          require idx < mem[96]
          mem[(32 * idx) + 128] = (t * userData[addr(cd[((32 * idx) + cd)].field_0 / 10000) - userData[addr(cd[((32 * idx) + cd)].field_256
          if not (t * userData[addr(cd[((32 * idx) + cd)].field_0 / 10000) - userData[addr(cd[((32 * idx) + cd)].field_256:
              idx = idx + 1
              continue 
          if t * userData[addr(cd[((32 * idx) + cd)].field_0 / 10000 < userData[addr(cd[((32 * idx) + cd)].field_256:
              revert with 0, 'SafeMath: addition overflow'
          mem[0] = addr(cd[((32 * idx) + cd)
          mem[32] = 7
          userData[addr(cd[((32 * idx) + cd)].field_256 = t * userData[addr(cd[((32 * idx) + cd)].field_0 / 10000
          _1508 = mem[64]
          mem[mem[64] + 36] = addr(cd[((32 * idx) + cd)
          mem[mem[64] + 68] = (t * userData[addr(cd[((32 * idx) + cd)].field_0 / 10000) - userData[addr(cd[((32 * idx) + cd)].field_256
          _1509 = mem[64]
          mem[mem[64]] = 68
          mem[64] = mem[64] + 100
          mem[_1509 + 32] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000 or mem[_1509 + 36 len 28]
          mem[64] = _1508 + 164
          mem[_1508 + 100] = 32
          mem[_1508 + 132] = 'SafeERC20: low-level call failed'
          if eth.balance(this.address) < 0:
              revert with 0, 32, 38, 0x73416464726573733a20696e73756666696369656e742062616c616e636520666f722063616c, mem[_1508 + 270 len 26]
          if not ext_code.size(tokenAddress):
              revert with 0, 'Address: call to non-contract'
          _1567 = mem[_1509]
          t = _1509 + 32
          u = mem[64]
          s = mem[_1509]
          while s >= 32:
              mem[u] = mem[t]
              t = t + 32
              u = u + 32
              s = s - 32
              continue 
          mem[mem[64] + floor32(mem[_1509])] = mem[_1509 + floor32(mem[_1509]) + -(mem[_1509] % 32) + 64 len mem[_1509] % 32] or Mask(8 * -(mem[_1509] % 32) + 32, -(8 * -(mem[_1509] % 32) + 32) + 256, mem[mem[64] + floor32(mem[_1509])])
          call tokenAddress.mem[mem[64] len 4] with:
               gas gas_remaining wei
              args mem[mem[64] + 4 len _1567 + _1508 + -mem[64] + 160]
          if not return_data.size:
              if ext_call.success:
                  if mem[96]:
                      require mem[96] >= 32
                      if not mem[128]:
                          revert with 0, 
                                      32,
                                      42,
                                      0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565,
                                      mem[mem[64] + 110 len 22]
                  idx = idx + 1
                  continue 
              if mem[96]:
                  revert with memory
                    from 128
                     len mem[96]
              _1946 = mem[64]
              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
              mem[mem[64] + 4] = 32
              mem[mem[64] + 36] = mem[_1508 + 100]
              _1948 = mem[_1508 + 100]
              idx = 0
              while idx < _1948:
                  mem[idx + _1946 + 68] = mem[idx + _1508 + 132]
                  idx = idx + 32
                  continue 
              if not _1948 % 32:
                  revert with memory
                    from mem[64]
                     len _1948 + _1946 + -mem[64] + 68
              mem[floor32(_1948) + _1946 + 68] = mem[floor32(_1948) + _1946 + -(_1948 % 32) + 100 len _1948 % 32]
              revert with memory
                from mem[64]
                 len floor32(_1948) + _1946 + -mem[64] + 100
          _1898 = mem[64]
          mem[64] = mem[64] + ceil32(return_data.size) + 1
          mem[_1898] = return_data.size
          mem[_1898 + 32 len return_data.size] = ext_call.return_data[0 len return_data.size]
          if ext_call.success:
              if return_data.size:
                  require return_data.size >= 32
                  if not mem[_1898 + 32]:
                      revert with 0, 
                                  32,
                                  42,
                                  0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565,
                                  mem[mem[64] + 110 len 22]
              idx = idx + 1
              continue 
          if return_data.size:
              revert with ext_call.return_data[0 len return_data.size]
          _1950 = mem[64]
          mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
          mem[mem[64] + 4] = 32
          mem[mem[64] + 36] = mem[_1508 + 100]
          _1952 = mem[_1508 + 100]
          idx = 0
          while idx < _1952:
              mem[idx + _1950 + 68] = mem[idx + _1508 + 132]
              idx = idx + 32
              continue 
          if not _1952 % 32:
              revert with memory
                from mem[64]
                 len _1952 + _1950 + -mem[64] + 68
          mem[floor32(_1952) + _1950 + 68] = mem[floor32(_1952) + _1950 + -(_1952 % 32) + 100 len _1952 % 32]
          revert with memory
            from mem[64]
             len floor32(_1952) + _1950 + -mem[64] + 100
  else:
      mem[128 len 32 * ('cd', 4).length] = call.data[calldata.size len 32 * ('cd', 4).length]
      idx = 0
      while idx < ('cd', 4).length:
          if userData[addr(cd[((32 * idx) + cd)].field_0 <= 0:
              revert with 0, 
                          32,
                          48,
                          0x646d61737352656c656173653a20536f6d652072656365697665727320617265206e6f742077686974656c6973746564,
                          mem[mem[64] + 116 len 16]
          mem[0] = addr(cd[((32 * idx) + cd)
          mem[32] = 7
          if block.timestamp < start:
              if userData[addr(cd[((32 * idx) + cd)].field_256 > 0:
                  revert with 0, 'SafeMath: subtraction overflow'
              require idx < mem[96]
              mem[(32 * idx) + 128] = -userData[addr(cd[((32 * idx) + cd)].field_256
              if not -userData[addr(cd[((32 * idx) + cd)].field_256:
                  idx = idx + 1
                  continue 
              if 0 < userData[addr(cd[((32 * idx) + cd)].field_256:
                  revert with 0, 'SafeMath: addition overflow'
              mem[0] = addr(cd[((32 * idx) + cd)
              mem[32] = 7
              userData[addr(cd[((32 * idx) + cd)].field_256 = 0
              _727 = mem[64]
              mem[mem[64] + 36] = addr(cd[((32 * idx) + cd)
              mem[mem[64] + 68] = -userData[addr(cd[((32 * idx) + cd)].field_256
              _728 = mem[64]
              mem[mem[64]] = 68
              mem[64] = mem[64] + 100
              mem[_728 + 32] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000 or mem[_728 + 36 len 28]
              mem[64] = _727 + 164
              mem[_727 + 100] = 32
              mem[_727 + 132] = 'SafeERC20: low-level call failed'
              if eth.balance(this.address) < 0:
                  revert with 0, 32, 38, 0x73416464726573733a20696e73756666696369656e742062616c616e636520666f722063616c, mem[_727 + 270 len 26]
              if not ext_code.size(tokenAddress):
                  revert with 0, 'Address: call to non-contract'
              _765 = mem[_728]
              t = _728 + 32
              u = _727 + 164
              s = mem[_728]
              while s >= 32:
                  mem[u] = mem[t]
                  t = t + 32
                  u = u + 32
                  s = s - 32
                  continue 
              mem[_727 + floor32(mem[_728]) + 164] = mem[_728 + -(mem[_728] % 32) + floor32(mem[_728]) + 64 len mem[_728] % 32] or Mask(8 * -(mem[_728] % 32) + 32, -(8 * -(mem[_728] % 32) + 32) + 256, mem[_727 + floor32(mem[_728]) + 164])
              call tokenAddress.mem[_727 + 164 len 4] with:
                   gas gas_remaining wei
                  args mem[_727 + 168 len _765 - 4]
              if not return_data.size:
                  if ext_call.success:
                      if mem[96]:
                          require mem[96] >= 32
                          if not mem[128]:
                              revert with 0, 
                                          32,
                                          42,
                                          0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565,
                                          mem[_727 + 274 len 22]
                      idx = idx + 1
                      continue 
                  if mem[96]:
                      revert with memory
                        from 128
                         len mem[96]
                  mem[_727 + 164] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                  mem[_727 + 168] = 32
                  mem[_727 + 200] = 32
                  idx = 0
                  while idx < 32:
                      mem[idx + _727 + 232] = mem[idx + _727 + 132]
                      idx = idx + 32
                      continue 
                  revert with memory
                    from mem[64]
                     len _727 + -mem[64] + 264
              mem[64] = _727 + ceil32(return_data.size) + 165
              mem[_727 + 164] = return_data.size
              mem[_727 + 196 len return_data.size] = ext_call.return_data[0 len return_data.size]
              if ext_call.success:
                  if return_data.size:
                      require return_data.size >= 32
                      if not mem[_727 + 196]:
                          revert with 0, 
                                      32,
                                      42,
                                      0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565,
                                      mem[_727 + ceil32(return_data.size) + 275 len 22]
                  idx = idx + 1
                  continue 
              if return_data.size:
                  revert with ext_call.return_data[0 len return_data.size]
              mem[_727 + ceil32(return_data.size) + 165] = 0x8c379a000000000000000000000000000000000000000000000000000000000
              mem[_727 + ceil32(return_data.size) + 169] = 32
              idx = 0
              while idx < 32:
                  mem[idx + _727 + ceil32(return_data.size) + 233] = mem[idx + _727 + 132]
                  idx = idx + 32
                  continue 
              revert with 0, 32, 32, mem[_727 + ceil32(return_data.size) + 233]
          if block.timestamp >= finish:
              if userData[addr(cd[((32 * idx) + cd)].field_256 > userData[addr(cd[((32 * idx) + cd)].field_0:
                  revert with 0, 'SafeMath: subtraction overflow'
              require idx < mem[96]
              mem[(32 * idx) + 128] = userData[addr(cd[((32 * idx) + cd)].field_0 - userData[addr(cd[((32 * idx) + cd)].field_256
              if not userData[addr(cd[((32 * idx) + cd)].field_0 - userData[addr(cd[((32 * idx) + cd)].field_256:
                  idx = idx + 1
                  continue 
              if userData[addr(cd[((32 * idx) + cd)].field_0 < userData[addr(cd[((32 * idx) + cd)].field_256:
                  revert with 0, 'SafeMath: addition overflow'
              mem[0] = addr(cd[((32 * idx) + cd)
              mem[32] = 7
              userData[addr(cd[((32 * idx) + cd)].field_256 = userData[addr(cd[((32 * idx) + cd)].field_0
              _734 = mem[64]
              mem[mem[64] + 36] = addr(cd[((32 * idx) + cd)
              mem[mem[64] + 68] = userData[addr(cd[((32 * idx) + cd)].field_0 - userData[addr(cd[((32 * idx) + cd)].field_256
              _735 = mem[64]
              mem[mem[64]] = 68
              mem[64] = mem[64] + 100
              mem[_735 + 32] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000 or mem[_735 + 36 len 28]
              mem[64] = _734 + 164
              mem[_734 + 100] = 32
              mem[_734 + 132] = 'SafeERC20: low-level call failed'
              if eth.balance(this.address) < 0:
                  revert with 0, 32, 38, 0x73416464726573733a20696e73756666696369656e742062616c616e636520666f722063616c, mem[_734 + 270 len 26]
              if not ext_code.size(tokenAddress):
                  revert with 0, 'Address: call to non-contract'
              _779 = mem[_735]
              t = _735 + 32
              u = _734 + 164
              s = mem[_735]
              while s >= 32:
                  mem[u] = mem[t]
                  t = t + 32
                  u = u + 32
                  s = s - 32
                  continue 
              mem[_734 + floor32(mem[_735]) + 164] = mem[_735 + -(mem[_735] % 32) + floor32(mem[_735]) + 64 len mem[_735] % 32] or Mask(8 * -(mem[_735] % 32) + 32, -(8 * -(mem[_735] % 32) + 32) + 256, mem[_734 + floor32(mem[_735]) + 164])
              call tokenAddress.mem[_734 + 164 len 4] with:
                   gas gas_remaining wei
                  args mem[_734 + 168 len _779 - 4]
              if not return_data.size:
                  if ext_call.success:
                      if mem[96]:
                          require mem[96] >= 32
                          if not mem[128]:
                              revert with 0, 
                                          32,
                                          42,
                                          0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565,
                                          mem[_734 + 274 len 22]
                      idx = idx + 1
                      continue 
                  if mem[96]:
                      revert with memory
                        from 128
                         len mem[96]
                  mem[_734 + 164] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                  mem[_734 + 168] = 32
                  mem[_734 + 200] = 32
                  idx = 0
                  while idx < 32:
                      mem[idx + _734 + 232] = mem[idx + _734 + 132]
                      idx = idx + 32
                      continue 
                  revert with memory
                    from mem[64]
                     len _734 + -mem[64] + 264
              mem[64] = _734 + ceil32(return_data.size) + 165
              mem[_734 + 164] = return_data.size
              mem[_734 + 196 len return_data.size] = ext_call.return_data[0 len return_data.size]
              if ext_call.success:
                  if return_data.size:
                      require return_data.size >= 32
                      if not mem[_734 + 196]:
                          revert with 0, 
                                      32,
                                      42,
                                      0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565,
                                      mem[_734 + ceil32(return_data.size) + 275 len 22]
                  idx = idx + 1
                  continue 
              if return_data.size:
                  revert with ext_call.return_data[0 len return_data.size]
              mem[_734 + ceil32(return_data.size) + 165] = 0x8c379a000000000000000000000000000000000000000000000000000000000
              mem[_734 + ceil32(return_data.size) + 169] = 32
              idx = 0
              while idx < 32:
                  mem[idx + _734 + ceil32(return_data.size) + 233] = mem[idx + _734 + 132]
                  idx = idx + 32
                  continue 
              revert with 0, 32, 32, mem[_734 + ceil32(return_data.size) + 233]
          if start > block.timestamp:
              revert with 0, 'SafeMath: subtraction overflow'
          s = 0
          t = 0
          u = block.timestamp - start
          while s < unknown3e79dafa.length:
              mem[0] = 3
              if u >= unknown3e79dafa[s]:
                  require s < unknown8aa71faa.length
                  if unknown8aa71faa[s] + t < t:
                      revert with 0, 'SafeMath: addition overflow'
                  require s < unknown3e79dafa.length
                  mem[0] = 3
                  if unknown3e79dafa[s] > u:
                      revert with 0, 'SafeMath: subtraction overflow'
                  s = s + 1
                  t = unknown8aa71faa[s] + t
                  u = u - unknown3e79dafa[s]
                  continue 
              if not userData[addr(cd[((32 * idx) + cd)].field_0:
                  if userData[addr(cd[((32 * idx) + cd)].field_256 > 0:
                      revert with 0, 'SafeMath: subtraction overflow'
                  require idx < mem[96]
                  mem[(32 * idx) + 128] = -userData[addr(cd[((32 * idx) + cd)].field_256
                  if not -userData[addr(cd[((32 * idx) + cd)].field_256:
                      idx = idx + 1
                      continue 
                  if 0 < userData[addr(cd[((32 * idx) + cd)].field_256:
                      revert with 0, 'SafeMath: addition overflow'
                  mem[0] = addr(cd[((32 * idx) + cd)
                  mem[32] = 7
                  userData[addr(cd[((32 * idx) + cd)].field_256 = 0
                  _1533 = mem[64]
                  mem[mem[64] + 36] = addr(cd[((32 * idx) + cd)
                  mem[mem[64] + 68] = -userData[addr(cd[((32 * idx) + cd)].field_256
                  _1534 = mem[64]
                  mem[mem[64]] = 68
                  mem[64] = mem[64] + 100
                  mem[_1534 + 32] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000 or mem[_1534 + 36 len 28]
                  mem[64] = _1533 + 164
                  mem[_1533 + 100] = 32
                  mem[_1533 + 132] = 'SafeERC20: low-level call failed'
                  if eth.balance(this.address) < 0:
                      revert with 0, 32, 38, 0x73416464726573733a20696e73756666696369656e742062616c616e636520666f722063616c, mem[_1533 + 270 len 26]
                  if not ext_code.size(tokenAddress):
                      revert with 0, 'Address: call to non-contract'
                  _1601 = mem[_1534]
                  t = _1534 + 32
                  u = _1533 + 164
                  s = mem[_1534]
                  while s >= 32:
                      mem[u] = mem[t]
                      t = t + 32
                      u = u + 32
                      s = s - 32
                      continue 
                  mem[_1533 + floor32(mem[_1534]) + 164] = mem[_1534 + -(mem[_1534] % 32) + floor32(mem[_1534]) + 64 len mem[_1534] % 32] or Mask(8 * -(mem[_1534] % 32) + 32, -(8 * -(mem[_1534] % 32) + 32) + 256, mem[_1533 + floor32(mem[_1534]) + 164])
                  call tokenAddress.mem[_1533 + 164 len 4] with:
                       gas gas_remaining wei
                      args mem[_1533 + 168 len _1601 - 4]
                  if not return_data.size:
                      if ext_call.success:
                          if mem[96]:
                              require mem[96] >= 32
                              if not mem[128]:
                                  revert with 0, 
                                              32,
                                              42,
                                              0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565,
                                              mem[_1533 + 274 len 22]
                          idx = idx + 1
                          continue 
                      if mem[96]:
                          revert with memory
                            from 128
                             len mem[96]
                      mem[_1533 + 164] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                      mem[_1533 + 168] = 32
                      mem[_1533 + 200] = 32
                      idx = 0
                      while idx < 32:
                          mem[idx + _1533 + 232] = mem[idx + _1533 + 132]
                          idx = idx + 32
                          continue 
                      revert with memory
                        from mem[64]
                         len _1533 + -mem[64] + 264
                  mem[64] = _1533 + ceil32(return_data.size) + 165
                  mem[_1533 + 164] = return_data.size
                  mem[_1533 + 196 len return_data.size] = ext_call.return_data[0 len return_data.size]
                  if ext_call.success:
                      if return_data.size:
                          require return_data.size >= 32
                          if not mem[_1533 + 196]:
                              revert with 0, 
                                          32,
                                          42,
                                          0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565,
                                          mem[_1533 + ceil32(return_data.size) + 275 len 22]
                      idx = idx + 1
                      continue 
                  if return_data.size:
                      revert with ext_call.return_data[0 len return_data.size]
                  mem[_1533 + ceil32(return_data.size) + 165] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                  mem[_1533 + ceil32(return_data.size) + 169] = 32
                  idx = 0
                  while idx < 32:
                      mem[idx + _1533 + ceil32(return_data.size) + 233] = mem[idx + _1533 + 132]
                      idx = idx + 32
                      continue 
                  revert with 0, 32, 32, mem[_1533 + ceil32(return_data.size) + 233]
              if t * userData[addr(cd[((32 * idx) + cd)].field_0 / userData[addr(cd[((32 * idx) + cd)].field_0 != t:
                  revert with 0, 32, 33, 0x21536166654d6174683a206d756c7469706c69636174696f6e206f766572666c6f, mem[mem[64] + 101 len 31]
              if userData[addr(cd[((32 * idx) + cd)].field_256 > t * userData[addr(cd[((32 * idx) + cd)].field_0 / 10000:
                  revert with 0, 'SafeMath: subtraction overflow'
              require idx < mem[96]
              mem[(32 * idx) + 128] = (t * userData[addr(cd[((32 * idx) + cd)].field_0 / 10000) - userData[addr(cd[((32 * idx) + cd)].field_256
              if not (t * userData[addr(cd[((32 * idx) + cd)].field_0 / 10000) - userData[addr(cd[((32 * idx) + cd)].field_256:
                  idx = idx + 1
                  continue 
              if t * userData[addr(cd[((32 * idx) + cd)].field_0 / 10000 < userData[addr(cd[((32 * idx) + cd)].field_256:
                  revert with 0, 'SafeMath: addition overflow'
              mem[0] = addr(cd[((32 * idx) + cd)
              mem[32] = 7
              userData[addr(cd[((32 * idx) + cd)].field_256 = t * userData[addr(cd[((32 * idx) + cd)].field_0 / 10000
              _1544 = mem[64]
              mem[mem[64] + 36] = addr(cd[((32 * idx) + cd)
              mem[mem[64] + 68] = (t * userData[addr(cd[((32 * idx) + cd)].field_0 / 10000) - userData[addr(cd[((32 * idx) + cd)].field_256
              _1545 = mem[64]
              mem[mem[64]] = 68
              mem[64] = mem[64] + 100
              mem[_1545 + 32] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000 or mem[_1545 + 36 len 28]
              mem[64] = _1544 + 164
              mem[_1544 + 100] = 32
              mem[_1544 + 132] = 'SafeERC20: low-level call failed'
              if eth.balance(this.address) < 0:
                  revert with 0, 32, 38, 0x73416464726573733a20696e73756666696369656e742062616c616e636520666f722063616c, mem[_1544 + 270 len 26]
              if not ext_code.size(tokenAddress):
                  revert with 0, 'Address: call to non-contract'
              _1611 = mem[_1545]
              t = _1545 + 32
              u = mem[64]
              s = mem[_1545]
              while s >= 32:
                  mem[u] = mem[t]
                  t = t + 32
                  u = u + 32
                  s = s - 32
                  continue 
              mem[mem[64] + floor32(mem[_1545])] = mem[_1545 + floor32(mem[_1545]) + -(mem[_1545] % 32) + 64 len mem[_1545] % 32] or Mask(8 * -(mem[_1545] % 32) + 32, -(8 * -(mem[_1545] % 32) + 32) + 256, mem[mem[64] + floor32(mem[_1545])])
              call tokenAddress.mem[mem[64] len 4] with:
                   gas gas_remaining wei
                  args mem[mem[64] + 4 len _1611 + _1544 + -mem[64] + 160]
              if not return_data.size:
                  if ext_call.success:
                      if mem[96]:
                          require mem[96] >= 32
                          if not mem[128]:
                              revert with 0, 
                                          32,
                                          42,
                                          0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565,
                                          mem[mem[64] + 110 len 22]
                      idx = idx + 1
                      continue 
                  if mem[96]:
                      revert with memory
                        from 128
                         len mem[96]
                  _1994 = mem[64]
                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                  mem[mem[64] + 4] = 32
                  mem[mem[64] + 36] = mem[_1544 + 100]
                  _1996 = mem[_1544 + 100]
                  idx = 0
                  while idx < _1996:
                      mem[idx + _1994 + 68] = mem[idx + _1544 + 132]
                      idx = idx + 32
                      continue 
                  if not _1996 % 32:
                      revert with memory
                        from mem[64]
                         len _1996 + _1994 + -mem[64] + 68
                  mem[floor32(_1996) + _1994 + 68] = mem[floor32(_1996) + _1994 + -(_1996 % 32) + 100 len _1996 % 32]
                  revert with memory
                    from mem[64]
                     len floor32(_1996) + _1994 + -mem[64] + 100
              _1912 = mem[64]
              mem[64] = mem[64] + ceil32(return_data.size) + 1
              mem[_1912] = return_data.size
              mem[_1912 + 32 len return_data.size] = ext_call.return_data[0 len return_data.size]
              if ext_call.success:
                  if return_data.size:
                      require return_data.size >= 32
                      if not mem[_1912 + 32]:
                          revert with 0, 
                                      32,
                                      42,
                                      0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565,
                                      mem[mem[64] + 110 len 22]
                  idx = idx + 1
                  continue 
              if return_data.size:
                  revert with ext_call.return_data[0 len return_data.size]
              _1998 = mem[64]
              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
              mem[mem[64] + 4] = 32
              mem[mem[64] + 36] = mem[_1544 + 100]
              _2000 = mem[_1544 + 100]
              idx = 0
              while idx < _2000:
                  mem[idx + _1998 + 68] = mem[idx + _1544 + 132]
                  idx = idx + 32
                  continue 
              if not _2000 % 32:
                  revert with memory
                    from mem[64]
                     len _2000 + _1998 + -mem[64] + 68
              mem[floor32(_2000) + _1998 + 68] = mem[floor32(_2000) + _1998 + -(_2000 % 32) + 100 len _2000 % 32]
              revert with memory
                from mem[64]
                 len floor32(_2000) + _1998 + -mem[64] + 100
          if not userData[addr(cd[((32 * idx) + cd)].field_0:
              if userData[addr(cd[((32 * idx) + cd)].field_256 > 0:
                  revert with 0, 'SafeMath: subtraction overflow'
              require idx < mem[96]
              mem[(32 * idx) + 128] = -userData[addr(cd[((32 * idx) + cd)].field_256
              if not -userData[addr(cd[((32 * idx) + cd)].field_256:
                  idx = idx + 1
                  continue 
              if 0 < userData[addr(cd[((32 * idx) + cd)].field_256:
                  revert with 0, 'SafeMath: addition overflow'
              mem[0] = addr(cd[((32 * idx) + cd)
              mem[32] = 7
              userData[addr(cd[((32 * idx) + cd)].field_256 = 0
              _1504 = mem[64]
              mem[mem[64] + 36] = addr(cd[((32 * idx) + cd)
              mem[mem[64] + 68] = -userData[addr(cd[((32 * idx) + cd)].field_256
              _1505 = mem[64]
              mem[mem[64]] = 68
              mem[64] = mem[64] + 100
              mem[_1505 + 32] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000 or mem[_1505 + 36 len 28]
              mem[64] = _1504 + 164
              mem[_1504 + 100] = 32
              mem[_1504 + 132] = 'SafeERC20: low-level call failed'
              if eth.balance(this.address) < 0:
                  revert with 0, 32, 38, 0x73416464726573733a20696e73756666696369656e742062616c616e636520666f722063616c, mem[_1504 + 270 len 26]
              if not ext_code.size(tokenAddress):
                  revert with 0, 'Address: call to non-contract'
              _1561 = mem[_1505]
              t = _1505 + 32
              u = _1504 + 164
              s = mem[_1505]
              while s >= 32:
                  mem[u] = mem[t]
                  t = t + 32
                  u = u + 32
                  s = s - 32
                  continue 
              mem[_1504 + floor32(mem[_1505]) + 164] = mem[_1505 + -(mem[_1505] % 32) + floor32(mem[_1505]) + 64 len mem[_1505] % 32] or Mask(8 * -(mem[_1505] % 32) + 32, -(8 * -(mem[_1505] % 32) + 32) + 256, mem[_1504 + floor32(mem[_1505]) + 164])
              call tokenAddress.mem[_1504 + 164 len 4] with:
                   gas gas_remaining wei
                  args mem[_1504 + 168 len _1561 - 4]
              if not return_data.size:
                  if ext_call.success:
                      if mem[96]:
                          require mem[96] >= 32
                          if not mem[128]:
                              revert with 0, 
                                          32,
                                          42,
                                          0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565,
                                          mem[_1504 + 274 len 22]
                      idx = idx + 1
                      continue 
                  if mem[96]:
                      revert with memory
                        from 128
                         len mem[96]
                  mem[_1504 + 164] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                  mem[_1504 + 168] = 32
                  mem[_1504 + 200] = 32
                  idx = 0
                  while idx < 32:
                      mem[idx + _1504 + 232] = mem[idx + _1504 + 132]
                      idx = idx + 32
                      continue 
                  revert with memory
                    from mem[64]
                     len _1504 + -mem[64] + 264
              mem[64] = _1504 + ceil32(return_data.size) + 165
              mem[_1504 + 164] = return_data.size
              mem[_1504 + 196 len return_data.size] = ext_call.return_data[0 len return_data.size]
              if ext_call.success:
                  if return_data.size:
                      require return_data.size >= 32
                      if not mem[_1504 + 196]:
                          revert with 0, 
                                      32,
                                      42,
                                      0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565,
                                      mem[_1504 + ceil32(return_data.size) + 275 len 22]
                  idx = idx + 1
                  continue 
              if return_data.size:
                  revert with ext_call.return_data[0 len return_data.size]
              mem[_1504 + ceil32(return_data.size) + 165] = 0x8c379a000000000000000000000000000000000000000000000000000000000
              mem[_1504 + ceil32(return_data.size) + 169] = 32
              idx = 0
              while idx < 32:
                  mem[idx + _1504 + ceil32(return_data.size) + 233] = mem[idx + _1504 + 132]
                  idx = idx + 32
                  continue 
              revert with 0, 32, 32, mem[_1504 + ceil32(return_data.size) + 233]
          if t * userData[addr(cd[((32 * idx) + cd)].field_0 / userData[addr(cd[((32 * idx) + cd)].field_0 != t:
              revert with 0, 32, 33, 0x21536166654d6174683a206d756c7469706c69636174696f6e206f766572666c6f, mem[mem[64] + 101 len 31]
          if userData[addr(cd[((32 * idx) + cd)].field_256 > t * userData[addr(cd[((32 * idx) + cd)].field_0 / 10000:
              revert with 0, 'SafeMath: subtraction overflow'
          require idx < mem[96]
          mem[(32 * idx) + 128] = (t * userData[addr(cd[((32 * idx) + cd)].field_0 / 10000) - userData[addr(cd[((32 * idx) + cd)].field_256
          if not (t * userData[addr(cd[((32 * idx) + cd)].field_0 / 10000) - userData[addr(cd[((32 * idx) + cd)].field_256:
              idx = idx + 1
              continue 
          if t * userData[addr(cd[((32 * idx) + cd)].field_0 / 10000 < userData[addr(cd[((32 * idx) + cd)].field_256:
              revert with 0, 'SafeMath: addition overflow'
          mem[0] = addr(cd[((32 * idx) + cd)
          mem[32] = 7
          userData[addr(cd[((32 * idx) + cd)].field_256 = t * userData[addr(cd[((32 * idx) + cd)].field_0 / 10000
          _1514 = mem[64]
          mem[mem[64] + 36] = addr(cd[((32 * idx) + cd)
          mem[mem[64] + 68] = (t * userData[addr(cd[((32 * idx) + cd)].field_0 / 10000) - userData[addr(cd[((32 * idx) + cd)].field_256
          _1515 = mem[64]
          mem[mem[64]] = 68
          mem[64] = mem[64] + 100
          mem[_1515 + 32] = 0xa9059cbb00000000000000000000000000000000000000000000000000000000 or mem[_1515 + 36 len 28]
          mem[64] = _1514 + 164
          mem[_1514 + 100] = 32
          mem[_1514 + 132] = 'SafeERC20: low-level call failed'
          if eth.balance(this.address) < 0:
              revert with 0, 32, 38, 0x73416464726573733a20696e73756666696369656e742062616c616e636520666f722063616c, mem[_1514 + 270 len 26]
          if not ext_code.size(tokenAddress):
              revert with 0, 'Address: call to non-contract'
          _1573 = mem[_1515]
          t = _1515 + 32
          u = mem[64]
          s = mem[_1515]
          while s >= 32:
              mem[u] = mem[t]
              t = t + 32
              u = u + 32
              s = s - 32
              continue 
          mem[mem[64] + floor32(mem[_1515])] = mem[_1515 + floor32(mem[_1515]) + -(mem[_1515] % 32) + 64 len mem[_1515] % 32] or Mask(8 * -(mem[_1515] % 32) + 32, -(8 * -(mem[_1515] % 32) + 32) + 256, mem[mem[64] + floor32(mem[_1515])])
          call tokenAddress.mem[mem[64] len 4] with:
               gas gas_remaining wei
              args mem[mem[64] + 4 len _1573 + _1514 + -mem[64] + 160]
          if not return_data.size:
              if ext_call.success:
                  if mem[96]:
                      require mem[96] >= 32
                      if not mem[128]:
                          revert with 0, 
                                      32,
                                      42,
                                      0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565,
                                      mem[mem[64] + 110 len 22]
                  idx = idx + 1
                  continue 
              if mem[96]:
                  revert with memory
                    from 128
                     len mem[96]
              _1978 = mem[64]
              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
              mem[mem[64] + 4] = 32
              mem[mem[64] + 36] = mem[_1514 + 100]
              _1980 = mem[_1514 + 100]
              idx = 0
              while idx < _1980:
                  mem[idx + _1978 + 68] = mem[idx + _1514 + 132]
                  idx = idx + 32
                  continue 
              if not _1980 % 32:
                  revert with memory
                    from mem[64]
                     len _1980 + _1978 + -mem[64] + 68
              mem[floor32(_1980) + _1978 + 68] = mem[floor32(_1980) + _1978 + -(_1980 % 32) + 100 len _1980 % 32]
              revert with memory
                from mem[64]
                 len floor32(_1980) + _1978 + -mem[64] + 100
          _1910 = mem[64]
          mem[64] = mem[64] + ceil32(return_data.size) + 1
          mem[_1910] = return_data.size
          mem[_1910 + 32 len return_data.size] = ext_call.return_data[0 len return_data.size]
          if ext_call.success:
              if return_data.size:
                  require return_data.size >= 32
                  if not mem[_1910 + 32]:
                      revert with 0, 
                                  32,
                                  42,
                                  0x215361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565,
                                  mem[mem[64] + 110 len 22]
              idx = idx + 1
              continue 
          if return_data.size:
              revert with ext_call.return_data[0 len return_data.size]
          _1982 = mem[64]
          mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
          mem[mem[64] + 4] = 32
          mem[mem[64] + 36] = mem[_1514 + 100]
          _1984 = mem[_1514 + 100]
          idx = 0
          while idx < _1984:
              mem[idx + _1982 + 68] = mem[idx + _1514 + 132]
              idx = idx + 32
              continue 
          if not _1984 % 32:
              revert with memory
                from mem[64]
                 len _1984 + _1982 + -mem[64] + 68
          mem[floor32(_1984) + _1982 + 68] = mem[floor32(_1984) + _1982 + -(_1984 % 32) + 100 len _1984 % 32]
          revert with memory
            from mem[64]
             len floor32(_1984) + _1982 + -mem[64] + 100
  mem[mem[64]] = 32
  mem[mem[64] + 32] = mem[96]
  mem[mem[64] + 64 len floor32(mem[96])] = mem[128 len floor32(mem[96])]
  return 32, mem[mem[64] + 32 len (32 * mem[96]) + 32]