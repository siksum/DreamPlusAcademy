# Palkeoramix decompiler. 

def storage:
  owner is addr at storage 0
  unknown5aa6e675Address is addr at storage 1

def unknown5aa6e675(): # not payable
  return unknown5aa6e675Address

def owner(): # not payable
  return owner

#
#  Regular functions
#

def _fallback() payable: # default function
  revert

def isOwner(): # not payable
  return (caller == owner)

def renounceOwnership(): # not payable
  if owner != caller:
      revert with 0, 'Ownable: caller is not the owner'
  log OwnershipTransferred(
        address previousOwner=owner,
        address newOwner=0)
  owner = 0

def transferOwnership(address _newOwner): # not payable
  require calldata.size - 4 >= 32
  if owner != caller:
      revert with 0, 'Ownable: caller is not the owner'
  if not _newOwner:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                  32,
                  38,
                  0x5c4f776e61626c653a206e6577206f776e657220697320746865207a65726f20616464726573,
                  mem[202 len 26]
  log OwnershipTransferred(
        address previousOwner=owner,
        address newOwner=_newOwner)
  owner = _newOwner

def unknown6e261df1(addr _param1, uint256 _param2): # not payable
  require calldata.size - 4 >= 64
  if owner != caller:
      revert with 0, 'Ownable: caller is not the owner'
  if _param2:
      if not _param1:
          call caller with:
             value _param2 wei
               gas 2300 * is_zero(value) wei
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
      else:
          if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == _param1:
              call caller with:
                 value _param2 wei
                   gas 2300 * is_zero(value) wei
              if not ext_call.success:
                  revert with ext_call.return_data[0 len return_data.size]
          else:
              if 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 == ext_code.hash(_param1):
                  revert with 0, 'SafeERC20: call to non-contract'
              if not ext_code.hash(_param1):
                  revert with 0, 'SafeERC20: call to non-contract'
              mem[196 len 64] = transfer(address to, uint256 tokens), caller, Mask(224, 32, _param2) >> 32
              call _param1 with:
                 funct uint32(caller)
                   gas gas_remaining wei
                  args Mask(224, 32, _param2) << 224, mem[260 len 4]
              if not return_data.size:
                  if not ext_call.success:
                      revert with 0, 'SafeERC20: low-level call failed'
                  if not transfer(address to, uint256 tokens), Mask(224, 32, caller) >> 32:
                      revert with 0, 32, 42, 0x295361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565, mem[306 len 22]
              else:
                  mem[228 len return_data.size] = ext_call.return_data[0 len return_data.size]
                  if not ext_call.success:
                      revert with 0, 'SafeERC20: low-level call failed'
                  if return_data.size:
                      require return_data.size >= 32
                      if not mem[228]:
                          revert with 0, 
                                      32,
                                      42,
                                      0x295361666545524332303a204552433230206f7065726174696f6e20646964206e6f7420737563636565,
                                      mem[ceil32(return_data.size) + 307 len 22]

def unknown9d80002f(addr _param1, addr _param2, uint256 _param3, uint256 _param4, array _param5, uint256 _param6) payable: 
  require calldata.size - 4 >= 192
  require _param5 <= 4294967296
  require _param5 + 36 <= calldata.size
  require _param5.length <= 4294967296 and _param5 + (32 * _param5.length) + 36 <= calldata.size
  if not _param2:
      mem[128 len 32 * _param5.length] = call.data[_param5 + 36 len 32 * _param5.length]
      if _param1 == _param2:
          if not _param2:
              if 0 > eth.balance(_param6):
                  revert with 0, 'SafeMath: subtraction overflow'
              if 0 < _param4:
                  revert with 0, 
                              32,
                              35,
                              0x5953776170583a2052657475726e20616d6f756e7420776173206e6f7420656e6f7567,
                              mem[(32 * _param5.length) + 295 len 29]
              else:
                  return 0
          if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == _param2:
              if 0 > eth.balance(_param6):
                  revert with 0, 'SafeMath: subtraction overflow'
              if 0 < _param4:
                  revert with 0, 
                              32,
                              35,
                              0x5953776170583a2052657475726e20616d6f756e7420776173206e6f7420656e6f7567,
                              mem[(32 * _param5.length) + 295 len 29]
              else:
                  return 0
          require ext_code.size(_param2)
          static call _param2.balanceOf(address tokenOwner) with:
                  gas gas_remaining wei
                 args addr(_param6)
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          require return_data.size >= 32
          if ext_call.return_data_param6) > ext_call.return_data[0]:
              revert with 0, 'SafeMath: subtraction overflow'
          if ext_call.return_data_param6) < _param4:
              revert with 0, 
                          32,
                          35,
                          0x5953776170583a2052657475726e20616d6f756e7420776173206e6f7420656e6f7567,
                          mem[(32 * _param5.length) + 295 len 29]
      else:
          mem[(32 * _param5.length) + 128] = 16704
          s = (32 * _param5.length) + 128
          idx = 16
          while idx - 1:
              mem[s + 32] = 16704
              s = s + 32
              idx = idx - 1
              continue 
          mem[(32 * _param5.length) + 640] = 3383
          mem[(32 * _param5.length) + 672] = 3404
          mem[(32 * _param5.length) + 704] = 3439
          mem[(32 * _param5.length) + 736] = 3452
          mem[(32 * _param5.length) + 768] = 3480
          mem[(32 * _param5.length) + 800] = 3514
          mem[(32 * _param5.length) + 832] = 3548
          mem[(32 * _param5.length) + 864] = 3582
          mem[(32 * _param5.length) + 896] = 3595
          mem[(32 * _param5.length) + 928] = 3623
          mem[(32 * _param5.length) + 960] = 3636
          mem[(32 * _param5.length) + 992] = 3649
          mem[(32 * _param5.length) + 1024] = 3662
          mem[(32 * _param5.length) + 1056] = 3690
          mem[(32 * _param5.length) + 1088] = 3724
          mem[(32 * _param5.length) + 1120] = 3737
          if _param5.length > 16:
              revert with 0, 
                          32,
                          63,
                          0x6453776170583a20446973747269627574696f6e2061727261792073686f756c64206e6f74206578636565642072657365727665732061727261792073697a,
                          mem[(32 * _param5.length) + 1283 len 1]
          idx = 0
          s = 0
          while idx < _param5.length:
              require idx < _param5.length
              if mem[(32 * idx) + 128] <= 0:
                  idx = idx + 1
                  s = s
                  continue 
              require idx < _param5.length
              if mem[(32 * idx) + 128] + s < s:
                  revert with 0, 'SafeMath: addition overflow'
              idx = idx + 1
              s = mem[(32 * idx) + 128] + s
              continue 
          if s:
              t = 0
              while t < _param5.length:
                  require t < _param5.length
                  if not mem[(32 * t) + 128]:
                      t = t + 1
                      continue 
                  require t < _param5.length
                  if _param3:
                      if mem[(32 * t) + 128] * _param3 / _param3 != mem[(32 * t) + 128]:
                          revert with 0, 
                                      32,
                                      33,
                                      0x68536166654d6174683a206d756c7469706c69636174696f6e206f766572666c6f,
                                      mem[(32 * _param5.length) + 1253 len 31]
                  mem[(32 * _param5.length) + 1152] = 26
                  mem[(32 * _param5.length) + 1184] = 'SafeMath: division by zero'
                  if s:
                      require t < 16
                      ...  # Decompilation aborted, sorry: ('jump to a parameter computed at runtime', ('mem', ('range', ('add', 668, ('mask_shl', 251, 0, 5, ('var', 2)), ('mask_shl', 251, 0, 5, ('cd', ('add', 4, ('param', '_param5'))))), 4)))
                  mem[(32 * _param5.length) + 1216] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                  mem[(32 * _param5.length) + 1220] = 32
                  idx = 32
                  while idx < 26:
                      mem[idx + (32 * _param5.length) + 1284] = mem[idx + (32 * _param5.length) + 1184]
                      idx = idx + 32
                      continue 
                  revert with 0, 'SafeMath: division by zero'
              if not _param2:
                  if 0 <= eth.balance(_param6):
                      if 0 < _param4:
                          revert with 0, 
                                      32,
                                      35,
                                      0x5953776170583a2052657475726e20616d6f756e7420776173206e6f7420656e6f7567,
                                      mem[(32 * _param5.length) + 1319 len 29]
                      else:
                          return 0
                  var43001 = 32
                  revert with 0, 'SafeMath: subtraction overflow'
              if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == _param2:
                  if 0 <= eth.balance(_param6):
                      if 0 < _param4:
                          revert with 0, 
                                      32,
                                      35,
                                      0x5953776170583a2052657475726e20616d6f756e7420776173206e6f7420656e6f7567,
                                      mem[(32 * _param5.length) + 1319 len 29]
                      else:
                          return 0
                  var43001 = 32
                  revert with 0, 'SafeMath: subtraction overflow'
          else:
              if not _param1:
                  call addr(_param6) with:
                     value call.value wei
                       gas 2300 * is_zero(value) wei
                  if not ext_call.success:
                      revert with ext_call.return_data[0 len return_data.size]
              else:
                  if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == _param1:
                      call addr(_param6) with:
                         value call.value wei
                           gas 2300 * is_zero(value) wei
                      if not ext_call.success:
                          revert with ext_call.return_data[0 len return_data.size]
              if not _param2:
                  if 0 > eth.balance(_param6):
                      revert with 0, 'SafeMath: subtraction overflow'
                  if 0 < _param4:
                      revert with 0, 
                                  32,
                                  35,
                                  0x5953776170583a2052657475726e20616d6f756e7420776173206e6f7420656e6f7567,
                                  mem[(32 * _param5.length) + 1319 len 29]
                  else:
                      return 0
              if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == _param2:
                  if 0 > eth.balance(_param6):
                      revert with 0, 'SafeMath: subtraction overflow'
                  if 0 < _param4:
                      revert with 0, 
                                  32,
                                  35,
                                  0x5953776170583a2052657475726e20616d6f756e7420776173206e6f7420656e6f7567,
                                  mem[(32 * _param5.length) + 1319 len 29]
                  else:
                      return 0
          ('iszero', ('eq', 1364068194842176056990105843868530818345537040110, ('param', '_param2')))
          require ext_code.size(_param2)
          static call _param2.balanceOf(address tokenOwner) with:
                  gas gas_remaining wei
                 args addr(_param6)
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          require return_data.size >= 32
          if ext_call.return_data_param6) > ext_call.return_data[0]:
              revert with 0, 'SafeMath: subtraction overflow'
          if ext_call.return_data_param6) < _param4:
              revert with 0, 
                          32,
                          35,
                          0x5953776170583a2052657475726e20616d6f756e7420776173206e6f7420656e6f7567,
                          mem[(32 * _param5.length) + 1319 len 29]
      ('ge', ('add', ('ext_call.return_data', 0, 32), ('mul', -1, ('balance', ('param', '_param6')))), ('param', '_param4'))
      return (ext_call.return_data_param6))
  if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == _param2:
      mem[128 len 32 * _param5.length] = call.data[_param5 + 36 len 32 * _param5.length]
      if _param1 == _param2:
          if not _param2:
              if 0 > eth.balance(_param6):
                  revert with 0, 'SafeMath: subtraction overflow'
              if 0 < _param4:
                  revert with 0, 
                              32,
                              35,
                              0x5953776170583a2052657475726e20616d6f756e7420776173206e6f7420656e6f7567,
                              mem[(32 * _param5.length) + 295 len 29]
              else:
                  return 0
          if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == _param2:
              if 0 > eth.balance(_param6):
                  revert with 0, 'SafeMath: subtraction overflow'
              if 0 < _param4:
                  revert with 0, 
                              32,
                              35,
                              0x5953776170583a2052657475726e20616d6f756e7420776173206e6f7420656e6f7567,
                              mem[(32 * _param5.length) + 295 len 29]
              else:
                  return 0
          require ext_code.size(_param2)
          static call _param2.balanceOf(address tokenOwner) with:
                  gas gas_remaining wei
                 args addr(_param6)
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          require return_data.size >= 32
          if ext_call.return_data_param6) > ext_call.return_data[0]:
              revert with 0, 'SafeMath: subtraction overflow'
          if ext_call.return_data_param6) < _param4:
              revert with 0, 
                          32,
                          35,
                          0x5953776170583a2052657475726e20616d6f756e7420776173206e6f7420656e6f7567,
                          mem[(32 * _param5.length) + 295 len 29]
      else:
          mem[(32 * _param5.length) + 128] = 16704
          s = (32 * _param5.length) + 128
          idx = 16
          while idx - 1:
              mem[s + 32] = 16704
              s = s + 32
              idx = idx - 1
              continue 
          mem[(32 * _param5.length) + 640] = 3383
          mem[(32 * _param5.length) + 672] = 3404
          mem[(32 * _param5.length) + 704] = 3439
          mem[(32 * _param5.length) + 736] = 3452
          mem[(32 * _param5.length) + 768] = 3480
          mem[(32 * _param5.length) + 800] = 3514
          mem[(32 * _param5.length) + 832] = 3548
          mem[(32 * _param5.length) + 864] = 3582
          mem[(32 * _param5.length) + 896] = 3595
          mem[(32 * _param5.length) + 928] = 3623
          mem[(32 * _param5.length) + 960] = 3636
          mem[(32 * _param5.length) + 992] = 3649
          mem[(32 * _param5.length) + 1024] = 3662
          mem[(32 * _param5.length) + 1056] = 3690
          mem[(32 * _param5.length) + 1088] = 3724
          mem[(32 * _param5.length) + 1120] = 3737
          if _param5.length > 16:
              revert with 0, 
                          32,
                          63,
                          0x6453776170583a20446973747269627574696f6e2061727261792073686f756c64206e6f74206578636565642072657365727665732061727261792073697a,
                          mem[(32 * _param5.length) + 1283 len 1]
          idx = 0
          s = 0
          while idx < _param5.length:
              require idx < _param5.length
              if mem[(32 * idx) + 128] <= 0:
                  idx = idx + 1
                  s = s
                  continue 
              require idx < _param5.length
              if mem[(32 * idx) + 128] + s < s:
                  revert with 0, 'SafeMath: addition overflow'
              idx = idx + 1
              s = mem[(32 * idx) + 128] + s
              continue 
          if s:
              t = 0
              while t < _param5.length:
                  require t < _param5.length
                  if not mem[(32 * t) + 128]:
                      t = t + 1
                      continue 
                  require t < _param5.length
                  if _param3:
                      if mem[(32 * t) + 128] * _param3 / _param3 != mem[(32 * t) + 128]:
                          revert with 0, 
                                      32,
                                      33,
                                      0x68536166654d6174683a206d756c7469706c69636174696f6e206f766572666c6f,
                                      mem[(32 * _param5.length) + 1253 len 31]
                  mem[(32 * _param5.length) + 1152] = 26
                  mem[(32 * _param5.length) + 1184] = 'SafeMath: division by zero'
                  if s:
                      require t < 16
                      ...  # Decompilation aborted, sorry: ('jump to a parameter computed at runtime', ('mem', ('range', ('add', 668, ('mask_shl', 251, 0, 5, ('var', 2)), ('mask_shl', 251, 0, 5, ('cd', ('add', 4, ('param', '_param5'))))), 4)))
                  mem[(32 * _param5.length) + 1216] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                  mem[(32 * _param5.length) + 1220] = 32
                  idx = 32
                  while idx < 26:
                      mem[idx + (32 * _param5.length) + 1284] = mem[idx + (32 * _param5.length) + 1184]
                      idx = idx + 32
                      continue 
                  revert with 0, 'SafeMath: division by zero'
              if not _param2:
                  if 0 <= eth.balance(_param6):
                      if 0 < _param4:
                          revert with 0, 
                                      32,
                                      35,
                                      0x5953776170583a2052657475726e20616d6f756e7420776173206e6f7420656e6f7567,
                                      mem[(32 * _param5.length) + 1319 len 29]
                      else:
                          return 0
                  var43001 = 32
                  revert with 0, 'SafeMath: subtraction overflow'
              if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == _param2:
                  if 0 <= eth.balance(_param6):
                      if 0 < _param4:
                          revert with 0, 
                                      32,
                                      35,
                                      0x5953776170583a2052657475726e20616d6f756e7420776173206e6f7420656e6f7567,
                                      mem[(32 * _param5.length) + 1319 len 29]
                      else:
                          return 0
                  var43001 = 32
                  revert with 0, 'SafeMath: subtraction overflow'
          else:
              if not _param1:
                  call addr(_param6) with:
                     value call.value wei
                       gas 2300 * is_zero(value) wei
                  if not ext_call.success:
                      revert with ext_call.return_data[0 len return_data.size]
              else:
                  if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == _param1:
                      call addr(_param6) with:
                         value call.value wei
                           gas 2300 * is_zero(value) wei
                      if not ext_call.success:
                          revert with ext_call.return_data[0 len return_data.size]
              if not _param2:
                  if 0 > eth.balance(_param6):
                      revert with 0, 'SafeMath: subtraction overflow'
                  if 0 < _param4:
                      revert with 0, 
                                  32,
                                  35,
                                  0x5953776170583a2052657475726e20616d6f756e7420776173206e6f7420656e6f7567,
                                  mem[(32 * _param5.length) + 1319 len 29]
                  else:
                      return 0
              if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == _param2:
                  if 0 > eth.balance(_param6):
                      revert with 0, 'SafeMath: subtraction overflow'
                  if 0 < _param4:
                      revert with 0, 
                                  32,
                                  35,
                                  0x5953776170583a2052657475726e20616d6f756e7420776173206e6f7420656e6f7567,
                                  mem[(32 * _param5.length) + 1319 len 29]
                  else:
                      return 0
          ('iszero', ('eq', 1364068194842176056990105843868530818345537040110, ('param', '_param2')))
          require ext_code.size(_param2)
          static call _param2.balanceOf(address tokenOwner) with:
                  gas gas_remaining wei
                 args addr(_param6)
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          require return_data.size >= 32
          if ext_call.return_data_param6) > ext_call.return_data[0]:
              revert with 0, 'SafeMath: subtraction overflow'
          if ext_call.return_data_param6) < _param4:
              revert with 0, 
                          32,
                          35,
                          0x5953776170583a2052657475726e20616d6f756e7420776173206e6f7420656e6f7567,
                          mem[(32 * _param5.length) + 1319 len 29]
      ('ge', ('add', ('ext_call.return_data', 0, 32), ('mul', -1, ('balance', ('param', '_param6')))), ('param', '_param4'))
      return (ext_call.return_data_param6))
  mem[100] = addr(_param6)
  require ext_code.size(_param2)
  static call _param2.balanceOf(address tokenOwner) with:
          gas gas_remaining wei
         args addr(_param6)
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  mem[128 len 32 * _param5.length] = call.data[_param5 + 36 len 32 * _param5.length]
  if _param1 == _param2:
      if not _param2:
          if eth.balance(_param6) - ext_call.return_data > eth.balance(_param6):
              revert with 0, 'SafeMath: subtraction overflow'
          if eth.balance(_param6) - ext_call.return_data < _param4:
              revert with 0, 
                          32,
                          35,
                          0x5953776170583a2052657475726e20616d6f756e7420776173206e6f7420656e6f7567,
                          mem[(32 * _param5.length) + 295 len 29]
          return (eth.balance(_param6) - ext_call.return_data[0])
      if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == _param2:
          if eth.balance(_param6) - ext_call.return_data > eth.balance(_param6):
              revert with 0, 'SafeMath: subtraction overflow'
          if eth.balance(_param6) - ext_call.return_data < _param4:
              revert with 0, 
                          32,
                          35,
                          0x5953776170583a2052657475726e20616d6f756e7420776173206e6f7420656e6f7567,
                          mem[(32 * _param5.length) + 295 len 29]
          return (eth.balance(_param6) - ext_call.return_data[0])
      require ext_code.size(_param2)
      static call _param2.balanceOf(address tokenOwner) with:
              gas gas_remaining wei
             args addr(_param6)
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      require return_data.size >= 32
      if 0 > ext_call.return_data[0]:
          revert with 0, 'SafeMath: subtraction overflow'
      if 0 < _param4:
          revert with 0, 
                      32,
                      35,
                      0x5953776170583a2052657475726e20616d6f756e7420776173206e6f7420656e6f7567,
                      mem[(32 * _param5.length) + 295 len 29]
  else:
      mem[(32 * _param5.length) + 128] = 16704
      s = (32 * _param5.length) + 128
      idx = 16
      while idx - 1:
          mem[s + 32] = 16704
          s = s + 32
          idx = idx - 1
          continue 
      mem[(32 * _param5.length) + 640] = 3383
      mem[(32 * _param5.length) + 672] = 3404
      mem[(32 * _param5.length) + 704] = 3439
      mem[(32 * _param5.length) + 736] = 3452
      mem[(32 * _param5.length) + 768] = 3480
      mem[(32 * _param5.length) + 800] = 3514
      mem[(32 * _param5.length) + 832] = 3548
      mem[(32 * _param5.length) + 864] = 3582
      mem[(32 * _param5.length) + 896] = 3595
      mem[(32 * _param5.length) + 928] = 3623
      mem[(32 * _param5.length) + 960] = 3636
      mem[(32 * _param5.length) + 992] = 3649
      mem[(32 * _param5.length) + 1024] = 3662
      mem[(32 * _param5.length) + 1056] = 3690
      mem[(32 * _param5.length) + 1088] = 3724
      mem[(32 * _param5.length) + 1120] = 3737
      if _param5.length > 16:
          revert with 0, 
                      32,
                      63,
                      0x6453776170583a20446973747269627574696f6e2061727261792073686f756c64206e6f74206578636565642072657365727665732061727261792073697a,
                      mem[(32 * _param5.length) + 1283 len 1]
      idx = 0
      s = 0
      while idx < _param5.length:
          require idx < _param5.length
          if mem[(32 * idx) + 128] <= 0:
              idx = idx + 1
              s = s
              continue 
          require idx < _param5.length
          if mem[(32 * idx) + 128] + s < s:
              revert with 0, 'SafeMath: addition overflow'
          idx = idx + 1
          s = mem[(32 * idx) + 128] + s
          continue 
      if s:
          t = 0
          while t < _param5.length:
              require t < _param5.length
              if not mem[(32 * t) + 128]:
                  t = t + 1
                  continue 
              require t < _param5.length
              if _param3:
                  if mem[(32 * t) + 128] * _param3 / _param3 != mem[(32 * t) + 128]:
                      revert with 0, 
                                  32,
                                  33,
                                  0x68536166654d6174683a206d756c7469706c69636174696f6e206f766572666c6f,
                                  mem[(32 * _param5.length) + 1253 len 31]
              mem[(32 * _param5.length) + 1152] = 26
              mem[(32 * _param5.length) + 1184] = 'SafeMath: division by zero'
              if s:
                  require t < 16
                  ...  # Decompilation aborted, sorry: ('jump to a parameter computed at runtime', ('mem', ('range', ('add', 668, ('mask_shl', 251, 0, 5, ('var', 2)), ('mask_shl', 251, 0, 5, ('cd', ('add', 4, ('param', '_param5'))))), 4)))
              mem[(32 * _param5.length) + 1216] = 0x8c379a000000000000000000000000000000000000000000000000000000000
              mem[(32 * _param5.length) + 1220] = 32
              idx = 32
              while idx < 26:
                  mem[idx + (32 * _param5.length) + 1284] = mem[idx + (32 * _param5.length) + 1184]
                  idx = idx + 32
                  continue 
              revert with 0, 'SafeMath: division by zero'
          if not _param2:
              if eth.balance(_param6) - ext_call.return_data <= eth.balance(_param6):
                  if eth.balance(_param6) - ext_call.return_data < _param4:
                      revert with 0, 
                                  32,
                                  35,
                                  0x5953776170583a2052657475726e20616d6f756e7420776173206e6f7420656e6f7567,
                                  mem[(32 * _param5.length) + 1319 len 29]
                  return (eth.balance(_param6) - ext_call.return_data[0])
              var46001 = 32
              revert with 0, 'SafeMath: subtraction overflow'
          if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == _param2:
              if eth.balance(_param6) - ext_call.return_data <= eth.balance(_param6):
                  if eth.balance(_param6) - ext_call.return_data < _param4:
                      revert with 0, 
                                  32,
                                  35,
                                  0x5953776170583a2052657475726e20616d6f756e7420776173206e6f7420656e6f7567,
                                  mem[(32 * _param5.length) + 1319 len 29]
                  return (eth.balance(_param6) - ext_call.return_data[0])
              var46001 = 32
              revert with 0, 'SafeMath: subtraction overflow'
      else:
          if not _param1:
              call addr(_param6) with:
                 value call.value wei
                   gas 2300 * is_zero(value) wei
              if not ext_call.success:
                  revert with ext_call.return_data[0 len return_data.size]
          else:
              if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == _param1:
                  call addr(_param6) with:
                     value call.value wei
                       gas 2300 * is_zero(value) wei
                  if not ext_call.success:
                      revert with ext_call.return_data[0 len return_data.size]
          if not _param2:
              if eth.balance(_param6) - ext_call.return_data > eth.balance(_param6):
                  revert with 0, 'SafeMath: subtraction overflow'
              if eth.balance(_param6) - ext_call.return_data < _param4:
                  revert with 0, 
                              32,
                              35,
                              0x5953776170583a2052657475726e20616d6f756e7420776173206e6f7420656e6f7567,
                              mem[(32 * _param5.length) + 1319 len 29]
              return (eth.balance(_param6) - ext_call.return_data[0])
          if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == _param2:
              if eth.balance(_param6) - ext_call.return_data > eth.balance(_param6):
                  revert with 0, 'SafeMath: subtraction overflow'
              if eth.balance(_param6) - ext_call.return_data < _param4:
                  revert with 0, 
                              32,
                              35,
                              0x5953776170583a2052657475726e20616d6f756e7420776173206e6f7420656e6f7567,
                              mem[(32 * _param5.length) + 1319 len 29]
              return (eth.balance(_param6) - ext_call.return_data[0])
      ('iszero', ('eq', 1364068194842176056990105843868530818345537040110, ('param', '_param2')))
      require ext_code.size(_param2)
      static call _param2.balanceOf(address tokenOwner) with:
              gas gas_remaining wei
             args addr(_param6)
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      require return_data.size >= 32
      if 0 > ext_call.return_data[0]:
          revert with 0, 'SafeMath: subtraction overflow'
      if 0 < _param4:
          revert with 0, 
                      32,
                      35,
                      0x5953776170583a2052657475726e20616d6f756e7420776173206e6f7420656e6f7567,
                      mem[(32 * _param5.length) + 1319 len 29]
  ('ge', 0, ('param', '_param4'))
  return 0

def unknown4f1f05bc() payable: 
  mem[64] = 96
  require calldata.size - 4 >= 160
  require cd <= 4294967296
  require cd <= calldata.size
  require ('cd', 4).length <= 4294967296 and cd * ('cd', 4).length) + 36 <= calldata.size
  require cd <= 4294967296
  require cd <= calldata.size
  require ('cd', 100).length <= 4294967296 and cd * ('cd', 100).length) + 36 <= calldata.size
  require ('cd', 4).length - 1 < ('cd', 4).length
  if not addr(cd[((32 * ('cd', 4).length - 1) + cd):
      idx = 1
      while idx < ('cd', 4).length:
          require idx - 1 < ('cd', 4).length
          if addr(cd[((32 * idx - 1) + cd) == addr(cd[((32 * idx) + cd):
              idx = idx + 1
              continue 
          require ('cd', 100).length <= 18446744073709551615
          _410 = mem[64]
          mem[mem[64]] = ('cd', 100).length
          mem[64] = mem[64] + (32 * ('cd', 100).length) + 32
          if not ('cd', 100).length:
              s = 0
              while s < ('cd', 100).length:
                  require s < mem[_410]
                  mem[(32 * s) + _410 + 32] = 0
                  s = s + 1
                  continue 
              require idx - 1 < ('cd', 4).length
              require idx < ('cd', 4).length
              if 1 == idx:
                  if idx == ('cd', 4).length - 1:
                      if addr(cd[((32 * idx - 1) + cd) == addr(cd[((32 * idx) + cd):
                          if idx != ('cd', 4).length - 1:
                              require idx < ('cd', 4).length
                              if addr(cd[((32 * idx) + cd):
                                  if addr(cd[((32 * idx) + cd) != 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee:
                                      mem[mem[64] + 4] = this.address
                                      require ext_code.size(addr(cd[((32 * idx) + cd))
                                      static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                              gas gas_remaining wei
                                             args addr(this.address)
                                      mem[mem[64]] = ext_call.return_data[0]
                                      if not ext_call.success:
                                          revert with ext_call.return_data[0 len return_data.size]
                                      require return_data.size >= 32
                              idx = idx + 1
                              continue 
                          _1193 = mem[64]
                          mem[64] = mem[64] + 64
                          mem[_1193] = 20
                          mem[_1193 + 32] = 0x737761704d756c746920737562206661696c6564000000000000000000000000
                          require idx < ('cd', 4).length
                          if not addr(cd[((32 * idx) + cd):
                              if 0 <= eth.balance(cd[132]):
                                  idx = idx + 1
                                  continue 
                              _1409 = mem[64]
                              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                              mem[mem[64] + 4] = 32
                              mem[mem[64] + 36] = 20
                              idx = 0
                              while idx < 20:
                                  mem[idx + _1409 + 68] = mem[idx + _1193 + 32]
                                  idx = idx + 32
                                  continue 
                              mem[_1409 + 68] = mem[_1409 + 80 len 20]
                              revert with memory
                                from mem[64]
                                 len _1409 + -mem[64] + 100
                          if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == addr(cd[((32 * idx) + cd):
                              if 0 <= eth.balance(cd[132]):
                                  idx = idx + 1
                                  continue 
                              _1412 = mem[64]
                              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                              mem[mem[64] + 4] = 32
                              mem[mem[64] + 36] = 20
                              idx = 0
                              while idx < 20:
                                  mem[idx + _1412 + 68] = mem[idx + _1193 + 32]
                                  idx = idx + 32
                                  continue 
                              mem[_1412 + 68] = mem[_1412 + 80 len 20]
                              revert with memory
                                from mem[64]
                                 len _1412 + -mem[64] + 100
                          mem[mem[64] + 4] = addr(cd)
                          require ext_code.size(addr(cd[((32 * idx) + cd))
                          static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                  gas gas_remaining wei
                                 args addr(cd)
                          mem[mem[64]] = ext_call.return_data[0]
                          if not ext_call.success:
                              revert with ext_call.return_data[0 len return_data.size]
                          require return_data.size >= 32
                          if ext_call.return_data <= ext_call.return_data[0]:
                              idx = idx + 1
                              continue 
                          _1603 = mem[64]
                          mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                          mem[mem[64] + 4] = 32
                          mem[mem[64] + 36] = 20
                          idx = 0
                          while idx < 20:
                              mem[idx + _1603 + 68] = mem[idx + _1193 + 32]
                              idx = idx + 32
                              continue 
                          mem[_1603 + 68] = mem[_1603 + 80 len 20]
                          revert with memory
                            from mem[64]
                             len _1603 + -mem[64] + 100
                      _1169 = mem[64]
                      mem[64] = mem[64] + 512
                      mem[_1169] = 16704
                      s = _1169
                      idx = 16
                      while idx - 1:
                          mem[s + 32] = 16704
                          s = s + 32
                          idx = idx - 1
                          continue 
                      _1985 = mem[64]
                      mem[64] = mem[64] + 512
                      mem[_1985] = 3383
                      mem[_1985 + 32] = 3404
                      mem[_1985 + 64] = 3439
                      mem[_1985 + 96] = 3452
                      mem[_1985 + 128] = 3480
                      mem[_1985 + 160] = 3514
                      mem[_1985 + 192] = 3548
                      mem[_1985 + 224] = 3582
                      mem[_1985 + 256] = 3595
                      mem[_1985 + 288] = 3623
                      mem[_1985 + 320] = 3636
                      mem[_1985 + 352] = 3649
                      mem[_1985 + 384] = 3662
                      mem[_1985 + 416] = 3690
                      mem[_1985 + 448] = 3724
                      mem[_1985 + 480] = 3737
                  else:
                      if addr(cd[((32 * idx - 1) + cd) == addr(cd[((32 * idx) + cd):
                          if idx != ('cd', 4).length - 1:
                              require idx < ('cd', 4).length
                              if addr(cd[((32 * idx) + cd):
                                  if addr(cd[((32 * idx) + cd) != 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee:
                                      mem[mem[64] + 4] = this.address
                                      require ext_code.size(addr(cd[((32 * idx) + cd))
                                      static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                              gas gas_remaining wei
                                             args addr(this.address)
                                      mem[mem[64]] = ext_call.return_data[0]
                                      if not ext_call.success:
                                          revert with ext_call.return_data[0 len return_data.size]
                                      require return_data.size >= 32
                              idx = idx + 1
                              continue 
                          _1194 = mem[64]
                          mem[64] = mem[64] + 64
                          mem[_1194] = 20
                          mem[_1194 + 32] = 0x737761704d756c746920737562206661696c6564000000000000000000000000
                          require idx < ('cd', 4).length
                          if not addr(cd[((32 * idx) + cd):
                              if 0 <= eth.balance(cd[132]):
                                  idx = idx + 1
                                  continue 
                              _1415 = mem[64]
                              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                              mem[mem[64] + 4] = 32
                              mem[mem[64] + 36] = 20
                              idx = 0
                              while idx < 20:
                                  mem[idx + _1415 + 68] = mem[idx + _1194 + 32]
                                  idx = idx + 32
                                  continue 
                              mem[_1415 + 68] = mem[_1415 + 80 len 20]
                              revert with memory
                                from mem[64]
                                 len _1415 + -mem[64] + 100
                          if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == addr(cd[((32 * idx) + cd):
                              if 0 <= eth.balance(cd[132]):
                                  idx = idx + 1
                                  continue 
                              _1418 = mem[64]
                              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                              mem[mem[64] + 4] = 32
                              mem[mem[64] + 36] = 20
                              idx = 0
                              while idx < 20:
                                  mem[idx + _1418 + 68] = mem[idx + _1194 + 32]
                                  idx = idx + 32
                                  continue 
                              mem[_1418 + 68] = mem[_1418 + 80 len 20]
                              revert with memory
                                from mem[64]
                                 len _1418 + -mem[64] + 100
                          mem[mem[64] + 4] = addr(cd)
                          require ext_code.size(addr(cd[((32 * idx) + cd))
                          static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                  gas gas_remaining wei
                                 args addr(cd)
                          mem[mem[64]] = ext_call.return_data[0]
                          if not ext_call.success:
                              revert with ext_call.return_data[0 len return_data.size]
                          require return_data.size >= 32
                          if ext_call.return_data <= ext_call.return_data[0]:
                              idx = idx + 1
                              continue 
                          _1610 = mem[64]
                          mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                          mem[mem[64] + 4] = 32
                          mem[mem[64] + 36] = 20
                          idx = 0
                          while idx < 20:
                              mem[idx + _1610 + 68] = mem[idx + _1194 + 32]
                              idx = idx + 32
                              continue 
                          mem[_1610 + 68] = mem[_1610 + 80 len 20]
                          revert with memory
                            from mem[64]
                             len _1610 + -mem[64] + 100
                      _1170 = mem[64]
                      mem[64] = mem[64] + 512
                      mem[_1170] = 16704
                      s = _1170
                      idx = 16
                      while idx - 1:
                          mem[s + 32] = 16704
                          s = s + 32
                          idx = idx - 1
                          continue 
                      _1993 = mem[64]
                      mem[64] = mem[64] + 512
                      mem[_1993] = 3383
                      mem[_1993 + 32] = 3404
                      mem[_1993 + 64] = 3439
                      mem[_1993 + 96] = 3452
                      mem[_1993 + 128] = 3480
                      mem[_1993 + 160] = 3514
                      mem[_1993 + 192] = 3548
                      mem[_1993 + 224] = 3582
                      mem[_1993 + 256] = 3595
                      mem[_1993 + 288] = 3623
                      mem[_1993 + 320] = 3636
                      mem[_1993 + 352] = 3649
                      mem[_1993 + 384] = 3662
                      mem[_1993 + 416] = 3690
                      mem[_1993 + 448] = 3724
                      mem[_1993 + 480] = 3737
              else:
                  if idx == ('cd', 4).length - 1:
                      if addr(cd[((32 * idx - 1) + cd) == addr(cd[((32 * idx) + cd):
                          if idx != ('cd', 4).length - 1:
                              require idx < ('cd', 4).length
                              if addr(cd[((32 * idx) + cd):
                                  if addr(cd[((32 * idx) + cd) != 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee:
                                      mem[mem[64] + 4] = this.address
                                      require ext_code.size(addr(cd[((32 * idx) + cd))
                                      static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                              gas gas_remaining wei
                                             args addr(this.address)
                                      mem[mem[64]] = ext_call.return_data[0]
                                      if not ext_call.success:
                                          revert with ext_call.return_data[0 len return_data.size]
                                      require return_data.size >= 32
                              idx = idx + 1
                              continue 
                          _1195 = mem[64]
                          mem[64] = mem[64] + 64
                          mem[_1195] = 20
                          mem[_1195 + 32] = 0x737761704d756c746920737562206661696c6564000000000000000000000000
                          require idx < ('cd', 4).length
                          if not addr(cd[((32 * idx) + cd):
                              if 0 <= eth.balance(cd[132]):
                                  idx = idx + 1
                                  continue 
                              _1421 = mem[64]
                              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                              mem[mem[64] + 4] = 32
                              mem[mem[64] + 36] = 20
                              idx = 0
                              while idx < 20:
                                  mem[idx + _1421 + 68] = mem[idx + _1195 + 32]
                                  idx = idx + 32
                                  continue 
                              mem[_1421 + 68] = mem[_1421 + 80 len 20]
                              revert with memory
                                from mem[64]
                                 len _1421 + -mem[64] + 100
                          if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == addr(cd[((32 * idx) + cd):
                              if 0 <= eth.balance(cd[132]):
                                  idx = idx + 1
                                  continue 
                              _1424 = mem[64]
                              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                              mem[mem[64] + 4] = 32
                              mem[mem[64] + 36] = 20
                              idx = 0
                              while idx < 20:
                                  mem[idx + _1424 + 68] = mem[idx + _1195 + 32]
                                  idx = idx + 32
                                  continue 
                              mem[_1424 + 68] = mem[_1424 + 80 len 20]
                              revert with memory
                                from mem[64]
                                 len _1424 + -mem[64] + 100
                          mem[mem[64] + 4] = addr(cd)
                          require ext_code.size(addr(cd[((32 * idx) + cd))
                          static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                  gas gas_remaining wei
                                 args addr(cd)
                          mem[mem[64]] = ext_call.return_data[0]
                          if not ext_call.success:
                              revert with ext_call.return_data[0 len return_data.size]
                          require return_data.size >= 32
                          if ext_call.return_data <= ext_call.return_data[0]:
                              idx = idx + 1
                              continue 
                          _1617 = mem[64]
                          mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                          mem[mem[64] + 4] = 32
                          mem[mem[64] + 36] = 20
                          idx = 0
                          while idx < 20:
                              mem[idx + _1617 + 68] = mem[idx + _1195 + 32]
                              idx = idx + 32
                              continue 
                          mem[_1617 + 68] = mem[_1617 + 80 len 20]
                          revert with memory
                            from mem[64]
                             len _1617 + -mem[64] + 100
                      _1171 = mem[64]
                      mem[64] = mem[64] + 512
                      mem[_1171] = 16704
                      s = _1171
                      idx = 16
                      while idx - 1:
                          mem[s + 32] = 16704
                          s = s + 32
                          idx = idx - 1
                          continue 
                      _2001 = mem[64]
                      mem[64] = mem[64] + 512
                      mem[_2001] = 3383
                      mem[_2001 + 32] = 3404
                      mem[_2001 + 64] = 3439
                      mem[_2001 + 96] = 3452
                      mem[_2001 + 128] = 3480
                      mem[_2001 + 160] = 3514
                      mem[_2001 + 192] = 3548
                      mem[_2001 + 224] = 3582
                      mem[_2001 + 256] = 3595
                      mem[_2001 + 288] = 3623
                      mem[_2001 + 320] = 3636
                      mem[_2001 + 352] = 3649
                      mem[_2001 + 384] = 3662
                      mem[_2001 + 416] = 3690
                      mem[_2001 + 448] = 3724
                      mem[_2001 + 480] = 3737
                  else:
                      if addr(cd[((32 * idx - 1) + cd) == addr(cd[((32 * idx) + cd):
                          if idx != ('cd', 4).length - 1:
                              require idx < ('cd', 4).length
                              if addr(cd[((32 * idx) + cd):
                                  if addr(cd[((32 * idx) + cd) != 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee:
                                      mem[mem[64] + 4] = this.address
                                      require ext_code.size(addr(cd[((32 * idx) + cd))
                                      static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                              gas gas_remaining wei
                                             args addr(this.address)
                                      mem[mem[64]] = ext_call.return_data[0]
                                      if not ext_call.success:
                                          revert with ext_call.return_data[0 len return_data.size]
                                      require return_data.size >= 32
                              idx = idx + 1
                              continue 
                          _1196 = mem[64]
                          mem[64] = mem[64] + 64
                          mem[_1196] = 20
                          mem[_1196 + 32] = 0x737761704d756c746920737562206661696c6564000000000000000000000000
                          require idx < ('cd', 4).length
                          if not addr(cd[((32 * idx) + cd):
                              if 0 <= eth.balance(cd[132]):
                                  idx = idx + 1
                                  continue 
                              _1427 = mem[64]
                              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                              mem[mem[64] + 4] = 32
                              mem[mem[64] + 36] = 20
                              idx = 0
                              while idx < 20:
                                  mem[idx + _1427 + 68] = mem[idx + _1196 + 32]
                                  idx = idx + 32
                                  continue 
                              mem[_1427 + 68] = mem[_1427 + 80 len 20]
                              revert with memory
                                from mem[64]
                                 len _1427 + -mem[64] + 100
                          if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == addr(cd[((32 * idx) + cd):
                              if 0 <= eth.balance(cd[132]):
                                  idx = idx + 1
                                  continue 
                              _1430 = mem[64]
                              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                              mem[mem[64] + 4] = 32
                              mem[mem[64] + 36] = 20
                              idx = 0
                              while idx < 20:
                                  mem[idx + _1430 + 68] = mem[idx + _1196 + 32]
                                  idx = idx + 32
                                  continue 
                              mem[_1430 + 68] = mem[_1430 + 80 len 20]
                              revert with memory
                                from mem[64]
                                 len _1430 + -mem[64] + 100
                          mem[mem[64] + 4] = addr(cd)
                          require ext_code.size(addr(cd[((32 * idx) + cd))
                          static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                  gas gas_remaining wei
                                 args addr(cd)
                          mem[mem[64]] = ext_call.return_data[0]
                          if not ext_call.success:
                              revert with ext_call.return_data[0 len return_data.size]
                          require return_data.size >= 32
                          if ext_call.return_data <= ext_call.return_data[0]:
                              idx = idx + 1
                              continue 
                          _1624 = mem[64]
                          mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                          mem[mem[64] + 4] = 32
                          mem[mem[64] + 36] = 20
                          idx = 0
                          while idx < 20:
                              mem[idx + _1624 + 68] = mem[idx + _1196 + 32]
                              idx = idx + 32
                              continue 
                          mem[_1624 + 68] = mem[_1624 + 80 len 20]
                          revert with memory
                            from mem[64]
                             len _1624 + -mem[64] + 100
                      _1172 = mem[64]
                      mem[64] = mem[64] + 512
                      mem[_1172] = 16704
                      s = _1172
                      idx = 16
                      while idx - 1:
                          mem[s + 32] = 16704
                          s = s + 32
                          idx = idx - 1
                          continue 
                      _2009 = mem[64]
                      mem[64] = mem[64] + 512
                      mem[_2009] = 3383
                      mem[_2009 + 32] = 3404
                      mem[_2009 + 64] = 3439
                      mem[_2009 + 96] = 3452
                      mem[_2009 + 128] = 3480
                      mem[_2009 + 160] = 3514
                      mem[_2009 + 192] = 3548
                      mem[_2009 + 224] = 3582
                      mem[_2009 + 256] = 3595
                      mem[_2009 + 288] = 3623
                      mem[_2009 + 320] = 3636
                      mem[_2009 + 352] = 3649
                      mem[_2009 + 384] = 3662
                      mem[_2009 + 416] = 3690
                      mem[_2009 + 448] = 3724
                      mem[_2009 + 480] = 3737
          else:
              mem[_410 + 32 len 32 * ('cd', 100).length] = call.data[calldata.size len 32 * ('cd', 100).length]
              s = 0
              while s < ('cd', 100).length:
                  require s < mem[_410]
                  mem[(32 * s) + _410 + 32] = 0
                  s = s + 1
                  continue 
              require idx - 1 < ('cd', 4).length
              require idx < ('cd', 4).length
              if 1 == idx:
                  if idx == ('cd', 4).length - 1:
                      if addr(cd[((32 * idx - 1) + cd) == addr(cd[((32 * idx) + cd):
                          if idx != ('cd', 4).length - 1:
                              require idx < ('cd', 4).length
                              if addr(cd[((32 * idx) + cd):
                                  if addr(cd[((32 * idx) + cd) != 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee:
                                      mem[mem[64] + 4] = this.address
                                      require ext_code.size(addr(cd[((32 * idx) + cd))
                                      static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                              gas gas_remaining wei
                                             args addr(this.address)
                                      mem[mem[64]] = ext_call.return_data[0]
                                      if not ext_call.success:
                                          revert with ext_call.return_data[0 len return_data.size]
                                      require return_data.size >= 32
                              idx = idx + 1
                              continue 
                          _1197 = mem[64]
                          mem[64] = mem[64] + 64
                          mem[_1197] = 20
                          mem[_1197 + 32] = 0x737761704d756c746920737562206661696c6564000000000000000000000000
                          require idx < ('cd', 4).length
                          if not addr(cd[((32 * idx) + cd):
                              if 0 <= eth.balance(cd[132]):
                                  idx = idx + 1
                                  continue 
                              _1433 = mem[64]
                              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                              mem[mem[64] + 4] = 32
                              mem[mem[64] + 36] = 20
                              idx = 0
                              while idx < 20:
                                  mem[idx + _1433 + 68] = mem[idx + _1197 + 32]
                                  idx = idx + 32
                                  continue 
                              mem[_1433 + 68] = mem[_1433 + 80 len 20]
                              revert with memory
                                from mem[64]
                                 len _1433 + -mem[64] + 100
                          if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == addr(cd[((32 * idx) + cd):
                              if 0 <= eth.balance(cd[132]):
                                  idx = idx + 1
                                  continue 
                              _1436 = mem[64]
                              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                              mem[mem[64] + 4] = 32
                              mem[mem[64] + 36] = 20
                              idx = 0
                              while idx < 20:
                                  mem[idx + _1436 + 68] = mem[idx + _1197 + 32]
                                  idx = idx + 32
                                  continue 
                              mem[_1436 + 68] = mem[_1436 + 80 len 20]
                              revert with memory
                                from mem[64]
                                 len _1436 + -mem[64] + 100
                          mem[mem[64] + 4] = addr(cd)
                          require ext_code.size(addr(cd[((32 * idx) + cd))
                          static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                  gas gas_remaining wei
                                 args addr(cd)
                          mem[mem[64]] = ext_call.return_data[0]
                          if not ext_call.success:
                              revert with ext_call.return_data[0 len return_data.size]
                          require return_data.size >= 32
                          if ext_call.return_data <= ext_call.return_data[0]:
                              idx = idx + 1
                              continue 
                          _1631 = mem[64]
                          mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                          mem[mem[64] + 4] = 32
                          mem[mem[64] + 36] = 20
                          idx = 0
                          while idx < 20:
                              mem[idx + _1631 + 68] = mem[idx + _1197 + 32]
                              idx = idx + 32
                              continue 
                          mem[_1631 + 68] = mem[_1631 + 80 len 20]
                          revert with memory
                            from mem[64]
                             len _1631 + -mem[64] + 100
                      _1173 = mem[64]
                      mem[64] = mem[64] + 512
                      mem[_1173] = 16704
                      s = _1173
                      idx = 16
                      while idx - 1:
                          mem[s + 32] = 16704
                          s = s + 32
                          idx = idx - 1
                          continue 
                      _2017 = mem[64]
                      mem[64] = mem[64] + 512
                      mem[_2017] = 3383
                      mem[_2017 + 32] = 3404
                      mem[_2017 + 64] = 3439
                      mem[_2017 + 96] = 3452
                      mem[_2017 + 128] = 3480
                      mem[_2017 + 160] = 3514
                      mem[_2017 + 192] = 3548
                      mem[_2017 + 224] = 3582
                      mem[_2017 + 256] = 3595
                      mem[_2017 + 288] = 3623
                      mem[_2017 + 320] = 3636
                      mem[_2017 + 352] = 3649
                      mem[_2017 + 384] = 3662
                      mem[_2017 + 416] = 3690
                      mem[_2017 + 448] = 3724
                      mem[_2017 + 480] = 3737
                  else:
                      if addr(cd[((32 * idx - 1) + cd) == addr(cd[((32 * idx) + cd):
                          if idx != ('cd', 4).length - 1:
                              require idx < ('cd', 4).length
                              if addr(cd[((32 * idx) + cd):
                                  if addr(cd[((32 * idx) + cd) != 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee:
                                      mem[mem[64] + 4] = this.address
                                      require ext_code.size(addr(cd[((32 * idx) + cd))
                                      static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                              gas gas_remaining wei
                                             args addr(this.address)
                                      mem[mem[64]] = ext_call.return_data[0]
                                      if not ext_call.success:
                                          revert with ext_call.return_data[0 len return_data.size]
                                      require return_data.size >= 32
                              idx = idx + 1
                              continue 
                          _1198 = mem[64]
                          mem[64] = mem[64] + 64
                          mem[_1198] = 20
                          mem[_1198 + 32] = 0x737761704d756c746920737562206661696c6564000000000000000000000000
                          require idx < ('cd', 4).length
                          if not addr(cd[((32 * idx) + cd):
                              if 0 <= eth.balance(cd[132]):
                                  idx = idx + 1
                                  continue 
                              _1439 = mem[64]
                              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                              mem[mem[64] + 4] = 32
                              mem[mem[64] + 36] = 20
                              idx = 0
                              while idx < 20:
                                  mem[idx + _1439 + 68] = mem[idx + _1198 + 32]
                                  idx = idx + 32
                                  continue 
                              mem[_1439 + 68] = mem[_1439 + 80 len 20]
                              revert with memory
                                from mem[64]
                                 len _1439 + -mem[64] + 100
                          if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == addr(cd[((32 * idx) + cd):
                              if 0 <= eth.balance(cd[132]):
                                  idx = idx + 1
                                  continue 
                              _1442 = mem[64]
                              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                              mem[mem[64] + 4] = 32
                              mem[mem[64] + 36] = 20
                              idx = 0
                              while idx < 20:
                                  mem[idx + _1442 + 68] = mem[idx + _1198 + 32]
                                  idx = idx + 32
                                  continue 
                              mem[_1442 + 68] = mem[_1442 + 80 len 20]
                              revert with memory
                                from mem[64]
                                 len _1442 + -mem[64] + 100
                          mem[mem[64] + 4] = addr(cd)
                          require ext_code.size(addr(cd[((32 * idx) + cd))
                          static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                  gas gas_remaining wei
                                 args addr(cd)
                          mem[mem[64]] = ext_call.return_data[0]
                          if not ext_call.success:
                              revert with ext_call.return_data[0 len return_data.size]
                          require return_data.size >= 32
                          if ext_call.return_data <= ext_call.return_data[0]:
                              idx = idx + 1
                              continue 
                          _1638 = mem[64]
                          mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                          mem[mem[64] + 4] = 32
                          mem[mem[64] + 36] = 20
                          idx = 0
                          while idx < 20:
                              mem[idx + _1638 + 68] = mem[idx + _1198 + 32]
                              idx = idx + 32
                              continue 
                          mem[_1638 + 68] = mem[_1638 + 80 len 20]
                          revert with memory
                            from mem[64]
                             len _1638 + -mem[64] + 100
                      _1174 = mem[64]
                      mem[64] = mem[64] + 512
                      mem[_1174] = 16704
                      s = _1174
                      idx = 16
                      while idx - 1:
                          mem[s + 32] = 16704
                          s = s + 32
                          idx = idx - 1
                          continue 
                      _2025 = mem[64]
                      mem[64] = mem[64] + 512
                      mem[_2025] = 3383
                      mem[_2025 + 32] = 3404
                      mem[_2025 + 64] = 3439
                      mem[_2025 + 96] = 3452
                      mem[_2025 + 128] = 3480
                      mem[_2025 + 160] = 3514
                      mem[_2025 + 192] = 3548
                      mem[_2025 + 224] = 3582
                      mem[_2025 + 256] = 3595
                      mem[_2025 + 288] = 3623
                      mem[_2025 + 320] = 3636
                      mem[_2025 + 352] = 3649
                      mem[_2025 + 384] = 3662
                      mem[_2025 + 416] = 3690
                      mem[_2025 + 448] = 3724
                      mem[_2025 + 480] = 3737
              else:
                  if idx == ('cd', 4).length - 1:
                      if addr(cd[((32 * idx - 1) + cd) == addr(cd[((32 * idx) + cd):
                          if idx != ('cd', 4).length - 1:
                              require idx < ('cd', 4).length
                              if addr(cd[((32 * idx) + cd):
                                  if addr(cd[((32 * idx) + cd) != 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee:
                                      mem[mem[64] + 4] = this.address
                                      require ext_code.size(addr(cd[((32 * idx) + cd))
                                      static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                              gas gas_remaining wei
                                             args addr(this.address)
                                      mem[mem[64]] = ext_call.return_data[0]
                                      if not ext_call.success:
                                          revert with ext_call.return_data[0 len return_data.size]
                                      require return_data.size >= 32
                              idx = idx + 1
                              continue 
                          _1199 = mem[64]
                          mem[64] = mem[64] + 64
                          mem[_1199] = 20
                          mem[_1199 + 32] = 0x737761704d756c746920737562206661696c6564000000000000000000000000
                          require idx < ('cd', 4).length
                          if not addr(cd[((32 * idx) + cd):
                              if 0 <= eth.balance(cd[132]):
                                  idx = idx + 1
                                  continue 
                              _1445 = mem[64]
                              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                              mem[mem[64] + 4] = 32
                              mem[mem[64] + 36] = 20
                              idx = 0
                              while idx < 20:
                                  mem[idx + _1445 + 68] = mem[idx + _1199 + 32]
                                  idx = idx + 32
                                  continue 
                              mem[_1445 + 68] = mem[_1445 + 80 len 20]
                              revert with memory
                                from mem[64]
                                 len _1445 + -mem[64] + 100
                          if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == addr(cd[((32 * idx) + cd):
                              if 0 <= eth.balance(cd[132]):
                                  idx = idx + 1
                                  continue 
                              _1448 = mem[64]
                              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                              mem[mem[64] + 4] = 32
                              mem[mem[64] + 36] = 20
                              idx = 0
                              while idx < 20:
                                  mem[idx + _1448 + 68] = mem[idx + _1199 + 32]
                                  idx = idx + 32
                                  continue 
                              mem[_1448 + 68] = mem[_1448 + 80 len 20]
                              revert with memory
                                from mem[64]
                                 len _1448 + -mem[64] + 100
                          mem[mem[64] + 4] = addr(cd)
                          require ext_code.size(addr(cd[((32 * idx) + cd))
                          static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                  gas gas_remaining wei
                                 args addr(cd)
                          mem[mem[64]] = ext_call.return_data[0]
                          if not ext_call.success:
                              revert with ext_call.return_data[0 len return_data.size]
                          require return_data.size >= 32
                          if ext_call.return_data <= ext_call.return_data[0]:
                              idx = idx + 1
                              continue 
                          _1645 = mem[64]
                          mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                          mem[mem[64] + 4] = 32
                          mem[mem[64] + 36] = 20
                          idx = 0
                          while idx < 20:
                              mem[idx + _1645 + 68] = mem[idx + _1199 + 32]
                              idx = idx + 32
                              continue 
                          mem[_1645 + 68] = mem[_1645 + 80 len 20]
                          revert with memory
                            from mem[64]
                             len _1645 + -mem[64] + 100
                      _1175 = mem[64]
                      mem[64] = mem[64] + 512
                      mem[_1175] = 16704
                      s = _1175
                      idx = 16
                      while idx - 1:
                          mem[s + 32] = 16704
                          s = s + 32
                          idx = idx - 1
                          continue 
                      _2033 = mem[64]
                      mem[64] = mem[64] + 512
                      mem[_2033] = 3383
                      mem[_2033 + 32] = 3404
                      mem[_2033 + 64] = 3439
                      mem[_2033 + 96] = 3452
                      mem[_2033 + 128] = 3480
                      mem[_2033 + 160] = 3514
                      mem[_2033 + 192] = 3548
                      mem[_2033 + 224] = 3582
                      mem[_2033 + 256] = 3595
                      mem[_2033 + 288] = 3623
                      mem[_2033 + 320] = 3636
                      mem[_2033 + 352] = 3649
                      mem[_2033 + 384] = 3662
                      mem[_2033 + 416] = 3690
                      mem[_2033 + 448] = 3724
                      mem[_2033 + 480] = 3737
                  else:
                      if addr(cd[((32 * idx - 1) + cd) == addr(cd[((32 * idx) + cd):
                          if idx != ('cd', 4).length - 1:
                              require idx < ('cd', 4).length
                              if addr(cd[((32 * idx) + cd):
                                  if addr(cd[((32 * idx) + cd) != 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee:
                                      mem[mem[64] + 4] = this.address
                                      require ext_code.size(addr(cd[((32 * idx) + cd))
                                      static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                              gas gas_remaining wei
                                             args addr(this.address)
                                      mem[mem[64]] = ext_call.return_data[0]
                                      if not ext_call.success:
                                          revert with ext_call.return_data[0 len return_data.size]
                                      require return_data.size >= 32
                              idx = idx + 1
                              continue 
                          _1200 = mem[64]
                          mem[64] = mem[64] + 64
                          mem[_1200] = 20
                          mem[_1200 + 32] = 0x737761704d756c746920737562206661696c6564000000000000000000000000
                          require idx < ('cd', 4).length
                          if not addr(cd[((32 * idx) + cd):
                              if 0 <= eth.balance(cd[132]):
                                  idx = idx + 1
                                  continue 
                              _1451 = mem[64]
                              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                              mem[mem[64] + 4] = 32
                              mem[mem[64] + 36] = 20
                              idx = 0
                              while idx < 20:
                                  mem[idx + _1451 + 68] = mem[idx + _1200 + 32]
                                  idx = idx + 32
                                  continue 
                              mem[_1451 + 68] = mem[_1451 + 80 len 20]
                              revert with memory
                                from mem[64]
                                 len _1451 + -mem[64] + 100
                          if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == addr(cd[((32 * idx) + cd):
                              if 0 <= eth.balance(cd[132]):
                                  idx = idx + 1
                                  continue 
                              _1454 = mem[64]
                              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                              mem[mem[64] + 4] = 32
                              mem[mem[64] + 36] = 20
                              idx = 0
                              while idx < 20:
                                  mem[idx + _1454 + 68] = mem[idx + _1200 + 32]
                                  idx = idx + 32
                                  continue 
                              mem[_1454 + 68] = mem[_1454 + 80 len 20]
                              revert with memory
                                from mem[64]
                                 len _1454 + -mem[64] + 100
                          mem[mem[64] + 4] = addr(cd)
                          require ext_code.size(addr(cd[((32 * idx) + cd))
                          static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                  gas gas_remaining wei
                                 args addr(cd)
                          mem[mem[64]] = ext_call.return_data[0]
                          if not ext_call.success:
                              revert with ext_call.return_data[0 len return_data.size]
                          require return_data.size >= 32
                          if ext_call.return_data <= ext_call.return_data[0]:
                              idx = idx + 1
                              continue 
                          _1652 = mem[64]
                          mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                          mem[mem[64] + 4] = 32
                          mem[mem[64] + 36] = 20
                          idx = 0
                          while idx < 20:
                              mem[idx + _1652 + 68] = mem[idx + _1200 + 32]
                              idx = idx + 32
                              continue 
                          mem[_1652 + 68] = mem[_1652 + 80 len 20]
                          revert with memory
                            from mem[64]
                             len _1652 + -mem[64] + 100
                      _1176 = mem[64]
                      mem[64] = mem[64] + 512
                      mem[_1176] = 16704
                      s = _1176
                      idx = 16
                      while idx - 1:
                          mem[s + 32] = 16704
                          s = s + 32
                          idx = idx - 1
                          continue 
                      _2041 = mem[64]
                      mem[64] = mem[64] + 512
                      mem[_2041] = 3383
                      mem[_2041 + 32] = 3404
                      mem[_2041 + 64] = 3439
                      mem[_2041 + 96] = 3452
                      mem[_2041 + 128] = 3480
                      mem[_2041 + 160] = 3514
                      mem[_2041 + 192] = 3548
                      mem[_2041 + 224] = 3582
                      mem[_2041 + 256] = 3595
                      mem[_2041 + 288] = 3623
                      mem[_2041 + 320] = 3636
                      mem[_2041 + 352] = 3649
                      mem[_2041 + 384] = 3662
                      mem[_2041 + 416] = 3690
                      mem[_2041 + 448] = 3724
                      mem[_2041 + 480] = 3737
          if mem[_410] > 16:
              revert with 0, 
                          32,
                          63,
                          0x6453776170583a20446973747269627574696f6e2061727261792073686f756c64206e6f74206578636565642072657365727665732061727261792073697a,
                          mem[mem[64] + 131 len 1]
          ...  # Decompilation aborted, sorry: ("decompilation didn't finish",)
  else:
      if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == addr(cd[((32 * ('cd', 4).length - 1) + cd):
          idx = 1
          while idx < ('cd', 4).length:
              require idx - 1 < ('cd', 4).length
              if addr(cd[((32 * idx - 1) + cd) == addr(cd[((32 * idx) + cd):
                  idx = idx + 1
                  continue 
              require ('cd', 100).length <= 18446744073709551615
              _412 = mem[64]
              mem[mem[64]] = ('cd', 100).length
              mem[64] = mem[64] + (32 * ('cd', 100).length) + 32
              if not ('cd', 100).length:
                  s = 0
                  while s < ('cd', 100).length:
                      require s < mem[_412]
                      mem[(32 * s) + _412 + 32] = 0
                      s = s + 1
                      continue 
                  require idx - 1 < ('cd', 4).length
                  require idx < ('cd', 4).length
                  if 1 == idx:
                      if idx == ('cd', 4).length - 1:
                          if addr(cd[((32 * idx - 1) + cd) == addr(cd[((32 * idx) + cd):
                              if idx != ('cd', 4).length - 1:
                                  require idx < ('cd', 4).length
                                  if addr(cd[((32 * idx) + cd):
                                      if addr(cd[((32 * idx) + cd) != 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee:
                                          mem[mem[64] + 4] = this.address
                                          require ext_code.size(addr(cd[((32 * idx) + cd))
                                          static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                                  gas gas_remaining wei
                                                 args addr(this.address)
                                          mem[mem[64]] = ext_call.return_data[0]
                                          if not ext_call.success:
                                              revert with ext_call.return_data[0 len return_data.size]
                                          require return_data.size >= 32
                                  idx = idx + 1
                                  continue 
                              _1209 = mem[64]
                              mem[64] = mem[64] + 64
                              mem[_1209] = 20
                              mem[_1209 + 32] = 0x737761704d756c746920737562206661696c6564000000000000000000000000
                              require idx < ('cd', 4).length
                              if not addr(cd[((32 * idx) + cd):
                                  if 0 <= eth.balance(cd[132]):
                                      idx = idx + 1
                                      continue 
                                  _1505 = mem[64]
                                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                  mem[mem[64] + 4] = 32
                                  mem[mem[64] + 36] = 20
                                  idx = 0
                                  while idx < 20:
                                      mem[idx + _1505 + 68] = mem[idx + _1209 + 32]
                                      idx = idx + 32
                                      continue 
                                  mem[_1505 + 68] = mem[_1505 + 80 len 20]
                                  revert with memory
                                    from mem[64]
                                     len _1505 + -mem[64] + 100
                              if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == addr(cd[((32 * idx) + cd):
                                  if 0 <= eth.balance(cd[132]):
                                      idx = idx + 1
                                      continue 
                                  _1508 = mem[64]
                                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                  mem[mem[64] + 4] = 32
                                  mem[mem[64] + 36] = 20
                                  idx = 0
                                  while idx < 20:
                                      mem[idx + _1508 + 68] = mem[idx + _1209 + 32]
                                      idx = idx + 32
                                      continue 
                                  mem[_1508 + 68] = mem[_1508 + 80 len 20]
                                  revert with memory
                                    from mem[64]
                                     len _1508 + -mem[64] + 100
                              mem[mem[64] + 4] = addr(cd)
                              require ext_code.size(addr(cd[((32 * idx) + cd))
                              static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                      gas gas_remaining wei
                                     args addr(cd)
                              mem[mem[64]] = ext_call.return_data[0]
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                              require return_data.size >= 32
                              if ext_call.return_data <= ext_call.return_data[0]:
                                  idx = idx + 1
                                  continue 
                              _1715 = mem[64]
                              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                              mem[mem[64] + 4] = 32
                              mem[mem[64] + 36] = 20
                              idx = 0
                              while idx < 20:
                                  mem[idx + _1715 + 68] = mem[idx + _1209 + 32]
                                  idx = idx + 32
                                  continue 
                              mem[_1715 + 68] = mem[_1715 + 80 len 20]
                              revert with memory
                                from mem[64]
                                 len _1715 + -mem[64] + 100
                          _1185 = mem[64]
                          mem[64] = mem[64] + 512
                          mem[_1185] = 16704
                          s = _1185
                          idx = 16
                          while idx - 1:
                              mem[s + 32] = 16704
                              s = s + 32
                              idx = idx - 1
                              continue 
                          _2113 = mem[64]
                          mem[64] = mem[64] + 512
                          mem[_2113] = 3383
                          mem[_2113 + 32] = 3404
                          mem[_2113 + 64] = 3439
                          mem[_2113 + 96] = 3452
                          mem[_2113 + 128] = 3480
                          mem[_2113 + 160] = 3514
                          mem[_2113 + 192] = 3548
                          mem[_2113 + 224] = 3582
                          mem[_2113 + 256] = 3595
                          mem[_2113 + 288] = 3623
                          mem[_2113 + 320] = 3636
                          mem[_2113 + 352] = 3649
                          mem[_2113 + 384] = 3662
                          mem[_2113 + 416] = 3690
                          mem[_2113 + 448] = 3724
                          mem[_2113 + 480] = 3737
                      else:
                          if addr(cd[((32 * idx - 1) + cd) == addr(cd[((32 * idx) + cd):
                              if idx != ('cd', 4).length - 1:
                                  require idx < ('cd', 4).length
                                  if addr(cd[((32 * idx) + cd):
                                      if addr(cd[((32 * idx) + cd) != 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee:
                                          mem[mem[64] + 4] = this.address
                                          require ext_code.size(addr(cd[((32 * idx) + cd))
                                          static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                                  gas gas_remaining wei
                                                 args addr(this.address)
                                          mem[mem[64]] = ext_call.return_data[0]
                                          if not ext_call.success:
                                              revert with ext_call.return_data[0 len return_data.size]
                                          require return_data.size >= 32
                                  idx = idx + 1
                                  continue 
                              _1210 = mem[64]
                              mem[64] = mem[64] + 64
                              mem[_1210] = 20
                              mem[_1210 + 32] = 0x737761704d756c746920737562206661696c6564000000000000000000000000
                              require idx < ('cd', 4).length
                              if not addr(cd[((32 * idx) + cd):
                                  if 0 <= eth.balance(cd[132]):
                                      idx = idx + 1
                                      continue 
                                  _1511 = mem[64]
                                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                  mem[mem[64] + 4] = 32
                                  mem[mem[64] + 36] = 20
                                  idx = 0
                                  while idx < 20:
                                      mem[idx + _1511 + 68] = mem[idx + _1210 + 32]
                                      idx = idx + 32
                                      continue 
                                  mem[_1511 + 68] = mem[_1511 + 80 len 20]
                                  revert with memory
                                    from mem[64]
                                     len _1511 + -mem[64] + 100
                              if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == addr(cd[((32 * idx) + cd):
                                  if 0 <= eth.balance(cd[132]):
                                      idx = idx + 1
                                      continue 
                                  _1514 = mem[64]
                                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                  mem[mem[64] + 4] = 32
                                  mem[mem[64] + 36] = 20
                                  idx = 0
                                  while idx < 20:
                                      mem[idx + _1514 + 68] = mem[idx + _1210 + 32]
                                      idx = idx + 32
                                      continue 
                                  mem[_1514 + 68] = mem[_1514 + 80 len 20]
                                  revert with memory
                                    from mem[64]
                                     len _1514 + -mem[64] + 100
                              mem[mem[64] + 4] = addr(cd)
                              require ext_code.size(addr(cd[((32 * idx) + cd))
                              static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                      gas gas_remaining wei
                                     args addr(cd)
                              mem[mem[64]] = ext_call.return_data[0]
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                              require return_data.size >= 32
                              if ext_call.return_data <= ext_call.return_data[0]:
                                  idx = idx + 1
                                  continue 
                              _1722 = mem[64]
                              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                              mem[mem[64] + 4] = 32
                              mem[mem[64] + 36] = 20
                              idx = 0
                              while idx < 20:
                                  mem[idx + _1722 + 68] = mem[idx + _1210 + 32]
                                  idx = idx + 32
                                  continue 
                              mem[_1722 + 68] = mem[_1722 + 80 len 20]
                              revert with memory
                                from mem[64]
                                 len _1722 + -mem[64] + 100
                          _1186 = mem[64]
                          mem[64] = mem[64] + 512
                          mem[_1186] = 16704
                          s = _1186
                          idx = 16
                          while idx - 1:
                              mem[s + 32] = 16704
                              s = s + 32
                              idx = idx - 1
                              continue 
                          _2121 = mem[64]
                          mem[64] = mem[64] + 512
                          mem[_2121] = 3383
                          mem[_2121 + 32] = 3404
                          mem[_2121 + 64] = 3439
                          mem[_2121 + 96] = 3452
                          mem[_2121 + 128] = 3480
                          mem[_2121 + 160] = 3514
                          mem[_2121 + 192] = 3548
                          mem[_2121 + 224] = 3582
                          mem[_2121 + 256] = 3595
                          mem[_2121 + 288] = 3623
                          mem[_2121 + 320] = 3636
                          mem[_2121 + 352] = 3649
                          mem[_2121 + 384] = 3662
                          mem[_2121 + 416] = 3690
                          mem[_2121 + 448] = 3724
                          mem[_2121 + 480] = 3737
                  else:
                      if idx == ('cd', 4).length - 1:
                          if addr(cd[((32 * idx - 1) + cd) == addr(cd[((32 * idx) + cd):
                              if idx != ('cd', 4).length - 1:
                                  require idx < ('cd', 4).length
                                  if addr(cd[((32 * idx) + cd):
                                      if addr(cd[((32 * idx) + cd) != 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee:
                                          mem[mem[64] + 4] = this.address
                                          require ext_code.size(addr(cd[((32 * idx) + cd))
                                          static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                                  gas gas_remaining wei
                                                 args addr(this.address)
                                          mem[mem[64]] = ext_call.return_data[0]
                                          if not ext_call.success:
                                              revert with ext_call.return_data[0 len return_data.size]
                                          require return_data.size >= 32
                                  idx = idx + 1
                                  continue 
                              _1211 = mem[64]
                              mem[64] = mem[64] + 64
                              mem[_1211] = 20
                              mem[_1211 + 32] = 0x737761704d756c746920737562206661696c6564000000000000000000000000
                              require idx < ('cd', 4).length
                              if not addr(cd[((32 * idx) + cd):
                                  if 0 <= eth.balance(cd[132]):
                                      idx = idx + 1
                                      continue 
                                  _1517 = mem[64]
                                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                  mem[mem[64] + 4] = 32
                                  mem[mem[64] + 36] = 20
                                  idx = 0
                                  while idx < 20:
                                      mem[idx + _1517 + 68] = mem[idx + _1211 + 32]
                                      idx = idx + 32
                                      continue 
                                  mem[_1517 + 68] = mem[_1517 + 80 len 20]
                                  revert with memory
                                    from mem[64]
                                     len _1517 + -mem[64] + 100
                              if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == addr(cd[((32 * idx) + cd):
                                  if 0 <= eth.balance(cd[132]):
                                      idx = idx + 1
                                      continue 
                                  _1520 = mem[64]
                                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                  mem[mem[64] + 4] = 32
                                  mem[mem[64] + 36] = 20
                                  idx = 0
                                  while idx < 20:
                                      mem[idx + _1520 + 68] = mem[idx + _1211 + 32]
                                      idx = idx + 32
                                      continue 
                                  mem[_1520 + 68] = mem[_1520 + 80 len 20]
                                  revert with memory
                                    from mem[64]
                                     len _1520 + -mem[64] + 100
                              mem[mem[64] + 4] = addr(cd)
                              require ext_code.size(addr(cd[((32 * idx) + cd))
                              static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                      gas gas_remaining wei
                                     args addr(cd)
                              mem[mem[64]] = ext_call.return_data[0]
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                              require return_data.size >= 32
                              if ext_call.return_data <= ext_call.return_data[0]:
                                  idx = idx + 1
                                  continue 
                              _1729 = mem[64]
                              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                              mem[mem[64] + 4] = 32
                              mem[mem[64] + 36] = 20
                              idx = 0
                              while idx < 20:
                                  mem[idx + _1729 + 68] = mem[idx + _1211 + 32]
                                  idx = idx + 32
                                  continue 
                              mem[_1729 + 68] = mem[_1729 + 80 len 20]
                              revert with memory
                                from mem[64]
                                 len _1729 + -mem[64] + 100
                          _1187 = mem[64]
                          mem[64] = mem[64] + 512
                          mem[_1187] = 16704
                          s = _1187
                          idx = 16
                          while idx - 1:
                              mem[s + 32] = 16704
                              s = s + 32
                              idx = idx - 1
                              continue 
                          _2129 = mem[64]
                          mem[64] = mem[64] + 512
                          mem[_2129] = 3383
                          mem[_2129 + 32] = 3404
                          mem[_2129 + 64] = 3439
                          mem[_2129 + 96] = 3452
                          mem[_2129 + 128] = 3480
                          mem[_2129 + 160] = 3514
                          mem[_2129 + 192] = 3548
                          mem[_2129 + 224] = 3582
                          mem[_2129 + 256] = 3595
                          mem[_2129 + 288] = 3623
                          mem[_2129 + 320] = 3636
                          mem[_2129 + 352] = 3649
                          mem[_2129 + 384] = 3662
                          mem[_2129 + 416] = 3690
                          mem[_2129 + 448] = 3724
                          mem[_2129 + 480] = 3737
                      else:
                          if addr(cd[((32 * idx - 1) + cd) == addr(cd[((32 * idx) + cd):
                              if idx != ('cd', 4).length - 1:
                                  require idx < ('cd', 4).length
                                  if addr(cd[((32 * idx) + cd):
                                      if addr(cd[((32 * idx) + cd) != 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee:
                                          mem[mem[64] + 4] = this.address
                                          require ext_code.size(addr(cd[((32 * idx) + cd))
                                          static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                                  gas gas_remaining wei
                                                 args addr(this.address)
                                          mem[mem[64]] = ext_call.return_data[0]
                                          if not ext_call.success:
                                              revert with ext_call.return_data[0 len return_data.size]
                                          require return_data.size >= 32
                                  idx = idx + 1
                                  continue 
                              _1212 = mem[64]
                              mem[64] = mem[64] + 64
                              mem[_1212] = 20
                              mem[_1212 + 32] = 0x737761704d756c746920737562206661696c6564000000000000000000000000
                              require idx < ('cd', 4).length
                              if not addr(cd[((32 * idx) + cd):
                                  if 0 <= eth.balance(cd[132]):
                                      idx = idx + 1
                                      continue 
                                  _1523 = mem[64]
                                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                  mem[mem[64] + 4] = 32
                                  mem[mem[64] + 36] = 20
                                  idx = 0
                                  while idx < 20:
                                      mem[idx + _1523 + 68] = mem[idx + _1212 + 32]
                                      idx = idx + 32
                                      continue 
                                  mem[_1523 + 68] = mem[_1523 + 80 len 20]
                                  revert with memory
                                    from mem[64]
                                     len _1523 + -mem[64] + 100
                              if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == addr(cd[((32 * idx) + cd):
                                  if 0 <= eth.balance(cd[132]):
                                      idx = idx + 1
                                      continue 
                                  _1526 = mem[64]
                                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                  mem[mem[64] + 4] = 32
                                  mem[mem[64] + 36] = 20
                                  idx = 0
                                  while idx < 20:
                                      mem[idx + _1526 + 68] = mem[idx + _1212 + 32]
                                      idx = idx + 32
                                      continue 
                                  mem[_1526 + 68] = mem[_1526 + 80 len 20]
                                  revert with memory
                                    from mem[64]
                                     len _1526 + -mem[64] + 100
                              mem[mem[64] + 4] = addr(cd)
                              require ext_code.size(addr(cd[((32 * idx) + cd))
                              static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                      gas gas_remaining wei
                                     args addr(cd)
                              mem[mem[64]] = ext_call.return_data[0]
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                              require return_data.size >= 32
                              if ext_call.return_data <= ext_call.return_data[0]:
                                  idx = idx + 1
                                  continue 
                              _1736 = mem[64]
                              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                              mem[mem[64] + 4] = 32
                              mem[mem[64] + 36] = 20
                              idx = 0
                              while idx < 20:
                                  mem[idx + _1736 + 68] = mem[idx + _1212 + 32]
                                  idx = idx + 32
                                  continue 
                              mem[_1736 + 68] = mem[_1736 + 80 len 20]
                              revert with memory
                                from mem[64]
                                 len _1736 + -mem[64] + 100
                          _1188 = mem[64]
                          mem[64] = mem[64] + 512
                          mem[_1188] = 16704
                          s = _1188
                          idx = 16
                          while idx - 1:
                              mem[s + 32] = 16704
                              s = s + 32
                              idx = idx - 1
                              continue 
                          _2137 = mem[64]
                          mem[64] = mem[64] + 512
                          mem[_2137] = 3383
                          mem[_2137 + 32] = 3404
                          mem[_2137 + 64] = 3439
                          mem[_2137 + 96] = 3452
                          mem[_2137 + 128] = 3480
                          mem[_2137 + 160] = 3514
                          mem[_2137 + 192] = 3548
                          mem[_2137 + 224] = 3582
                          mem[_2137 + 256] = 3595
                          mem[_2137 + 288] = 3623
                          mem[_2137 + 320] = 3636
                          mem[_2137 + 352] = 3649
                          mem[_2137 + 384] = 3662
                          mem[_2137 + 416] = 3690
                          mem[_2137 + 448] = 3724
                          mem[_2137 + 480] = 3737
              else:
                  mem[_412 + 32 len 32 * ('cd', 100).length] = call.data[calldata.size len 32 * ('cd', 100).length]
                  s = 0
                  while s < ('cd', 100).length:
                      require s < mem[_412]
                      mem[(32 * s) + _412 + 32] = 0
                      s = s + 1
                      continue 
                  require idx - 1 < ('cd', 4).length
                  require idx < ('cd', 4).length
                  if 1 == idx:
                      if idx == ('cd', 4).length - 1:
                          if addr(cd[((32 * idx - 1) + cd) == addr(cd[((32 * idx) + cd):
                              if idx != ('cd', 4).length - 1:
                                  require idx < ('cd', 4).length
                                  if addr(cd[((32 * idx) + cd):
                                      if addr(cd[((32 * idx) + cd) != 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee:
                                          mem[mem[64] + 4] = this.address
                                          require ext_code.size(addr(cd[((32 * idx) + cd))
                                          static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                                  gas gas_remaining wei
                                                 args addr(this.address)
                                          mem[mem[64]] = ext_call.return_data[0]
                                          if not ext_call.success:
                                              revert with ext_call.return_data[0 len return_data.size]
                                          require return_data.size >= 32
                                  idx = idx + 1
                                  continue 
                              _1213 = mem[64]
                              mem[64] = mem[64] + 64
                              mem[_1213] = 20
                              mem[_1213 + 32] = 0x737761704d756c746920737562206661696c6564000000000000000000000000
                              require idx < ('cd', 4).length
                              if not addr(cd[((32 * idx) + cd):
                                  if 0 <= eth.balance(cd[132]):
                                      idx = idx + 1
                                      continue 
                                  _1529 = mem[64]
                                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                  mem[mem[64] + 4] = 32
                                  mem[mem[64] + 36] = 20
                                  idx = 0
                                  while idx < 20:
                                      mem[idx + _1529 + 68] = mem[idx + _1213 + 32]
                                      idx = idx + 32
                                      continue 
                                  mem[_1529 + 68] = mem[_1529 + 80 len 20]
                                  revert with memory
                                    from mem[64]
                                     len _1529 + -mem[64] + 100
                              if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == addr(cd[((32 * idx) + cd):
                                  if 0 <= eth.balance(cd[132]):
                                      idx = idx + 1
                                      continue 
                                  _1532 = mem[64]
                                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                  mem[mem[64] + 4] = 32
                                  mem[mem[64] + 36] = 20
                                  idx = 0
                                  while idx < 20:
                                      mem[idx + _1532 + 68] = mem[idx + _1213 + 32]
                                      idx = idx + 32
                                      continue 
                                  mem[_1532 + 68] = mem[_1532 + 80 len 20]
                                  revert with memory
                                    from mem[64]
                                     len _1532 + -mem[64] + 100
                              mem[mem[64] + 4] = addr(cd)
                              require ext_code.size(addr(cd[((32 * idx) + cd))
                              static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                      gas gas_remaining wei
                                     args addr(cd)
                              mem[mem[64]] = ext_call.return_data[0]
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                              require return_data.size >= 32
                              if ext_call.return_data <= ext_call.return_data[0]:
                                  idx = idx + 1
                                  continue 
                              _1743 = mem[64]
                              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                              mem[mem[64] + 4] = 32
                              mem[mem[64] + 36] = 20
                              idx = 0
                              while idx < 20:
                                  mem[idx + _1743 + 68] = mem[idx + _1213 + 32]
                                  idx = idx + 32
                                  continue 
                              mem[_1743 + 68] = mem[_1743 + 80 len 20]
                              revert with memory
                                from mem[64]
                                 len _1743 + -mem[64] + 100
                          _1189 = mem[64]
                          mem[64] = mem[64] + 512
                          mem[_1189] = 16704
                          s = _1189
                          idx = 16
                          while idx - 1:
                              mem[s + 32] = 16704
                              s = s + 32
                              idx = idx - 1
                              continue 
                          _2145 = mem[64]
                          mem[64] = mem[64] + 512
                          mem[_2145] = 3383
                          mem[_2145 + 32] = 3404
                          mem[_2145 + 64] = 3439
                          mem[_2145 + 96] = 3452
                          mem[_2145 + 128] = 3480
                          mem[_2145 + 160] = 3514
                          mem[_2145 + 192] = 3548
                          mem[_2145 + 224] = 3582
                          mem[_2145 + 256] = 3595
                          mem[_2145 + 288] = 3623
                          mem[_2145 + 320] = 3636
                          mem[_2145 + 352] = 3649
                          mem[_2145 + 384] = 3662
                          mem[_2145 + 416] = 3690
                          mem[_2145 + 448] = 3724
                          mem[_2145 + 480] = 3737
                      else:
                          if addr(cd[((32 * idx - 1) + cd) == addr(cd[((32 * idx) + cd):
                              if idx != ('cd', 4).length - 1:
                                  require idx < ('cd', 4).length
                                  if addr(cd[((32 * idx) + cd):
                                      if addr(cd[((32 * idx) + cd) != 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee:
                                          mem[mem[64] + 4] = this.address
                                          require ext_code.size(addr(cd[((32 * idx) + cd))
                                          static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                                  gas gas_remaining wei
                                                 args addr(this.address)
                                          mem[mem[64]] = ext_call.return_data[0]
                                          if not ext_call.success:
                                              revert with ext_call.return_data[0 len return_data.size]
                                          require return_data.size >= 32
                                  idx = idx + 1
                                  continue 
                              _1214 = mem[64]
                              mem[64] = mem[64] + 64
                              mem[_1214] = 20
                              mem[_1214 + 32] = 0x737761704d756c746920737562206661696c6564000000000000000000000000
                              require idx < ('cd', 4).length
                              if not addr(cd[((32 * idx) + cd):
                                  if 0 <= eth.balance(cd[132]):
                                      idx = idx + 1
                                      continue 
                                  _1535 = mem[64]
                                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                  mem[mem[64] + 4] = 32
                                  mem[mem[64] + 36] = 20
                                  idx = 0
                                  while idx < 20:
                                      mem[idx + _1535 + 68] = mem[idx + _1214 + 32]
                                      idx = idx + 32
                                      continue 
                                  mem[_1535 + 68] = mem[_1535 + 80 len 20]
                                  revert with memory
                                    from mem[64]
                                     len _1535 + -mem[64] + 100
                              if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == addr(cd[((32 * idx) + cd):
                                  if 0 <= eth.balance(cd[132]):
                                      idx = idx + 1
                                      continue 
                                  _1538 = mem[64]
                                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                  mem[mem[64] + 4] = 32
                                  mem[mem[64] + 36] = 20
                                  idx = 0
                                  while idx < 20:
                                      mem[idx + _1538 + 68] = mem[idx + _1214 + 32]
                                      idx = idx + 32
                                      continue 
                                  mem[_1538 + 68] = mem[_1538 + 80 len 20]
                                  revert with memory
                                    from mem[64]
                                     len _1538 + -mem[64] + 100
                              mem[mem[64] + 4] = addr(cd)
                              require ext_code.size(addr(cd[((32 * idx) + cd))
                              static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                      gas gas_remaining wei
                                     args addr(cd)
                              mem[mem[64]] = ext_call.return_data[0]
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                              require return_data.size >= 32
                              if ext_call.return_data <= ext_call.return_data[0]:
                                  idx = idx + 1
                                  continue 
                              _1750 = mem[64]
                              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                              mem[mem[64] + 4] = 32
                              mem[mem[64] + 36] = 20
                              idx = 0
                              while idx < 20:
                                  mem[idx + _1750 + 68] = mem[idx + _1214 + 32]
                                  idx = idx + 32
                                  continue 
                              mem[_1750 + 68] = mem[_1750 + 80 len 20]
                              revert with memory
                                from mem[64]
                                 len _1750 + -mem[64] + 100
                          _1190 = mem[64]
                          mem[64] = mem[64] + 512
                          mem[_1190] = 16704
                          s = _1190
                          idx = 16
                          while idx - 1:
                              mem[s + 32] = 16704
                              s = s + 32
                              idx = idx - 1
                              continue 
                          _2153 = mem[64]
                          mem[64] = mem[64] + 512
                          mem[_2153] = 3383
                          mem[_2153 + 32] = 3404
                          mem[_2153 + 64] = 3439
                          mem[_2153 + 96] = 3452
                          mem[_2153 + 128] = 3480
                          mem[_2153 + 160] = 3514
                          mem[_2153 + 192] = 3548
                          mem[_2153 + 224] = 3582
                          mem[_2153 + 256] = 3595
                          mem[_2153 + 288] = 3623
                          mem[_2153 + 320] = 3636
                          mem[_2153 + 352] = 3649
                          mem[_2153 + 384] = 3662
                          mem[_2153 + 416] = 3690
                          mem[_2153 + 448] = 3724
                          mem[_2153 + 480] = 3737
                  else:
                      if idx == ('cd', 4).length - 1:
                          if addr(cd[((32 * idx - 1) + cd) == addr(cd[((32 * idx) + cd):
                              if idx != ('cd', 4).length - 1:
                                  require idx < ('cd', 4).length
                                  if addr(cd[((32 * idx) + cd):
                                      if addr(cd[((32 * idx) + cd) != 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee:
                                          mem[mem[64] + 4] = this.address
                                          require ext_code.size(addr(cd[((32 * idx) + cd))
                                          static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                                  gas gas_remaining wei
                                                 args addr(this.address)
                                          mem[mem[64]] = ext_call.return_data[0]
                                          if not ext_call.success:
                                              revert with ext_call.return_data[0 len return_data.size]
                                          require return_data.size >= 32
                                  idx = idx + 1
                                  continue 
                              _1215 = mem[64]
                              mem[64] = mem[64] + 64
                              mem[_1215] = 20
                              mem[_1215 + 32] = 0x737761704d756c746920737562206661696c6564000000000000000000000000
                              require idx < ('cd', 4).length
                              if not addr(cd[((32 * idx) + cd):
                                  if 0 <= eth.balance(cd[132]):
                                      idx = idx + 1
                                      continue 
                                  _1541 = mem[64]
                                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                  mem[mem[64] + 4] = 32
                                  mem[mem[64] + 36] = 20
                                  idx = 0
                                  while idx < 20:
                                      mem[idx + _1541 + 68] = mem[idx + _1215 + 32]
                                      idx = idx + 32
                                      continue 
                                  mem[_1541 + 68] = mem[_1541 + 80 len 20]
                                  revert with memory
                                    from mem[64]
                                     len _1541 + -mem[64] + 100
                              if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == addr(cd[((32 * idx) + cd):
                                  if 0 <= eth.balance(cd[132]):
                                      idx = idx + 1
                                      continue 
                                  _1544 = mem[64]
                                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                  mem[mem[64] + 4] = 32
                                  mem[mem[64] + 36] = 20
                                  idx = 0
                                  while idx < 20:
                                      mem[idx + _1544 + 68] = mem[idx + _1215 + 32]
                                      idx = idx + 32
                                      continue 
                                  mem[_1544 + 68] = mem[_1544 + 80 len 20]
                                  revert with memory
                                    from mem[64]
                                     len _1544 + -mem[64] + 100
                              mem[mem[64] + 4] = addr(cd)
                              require ext_code.size(addr(cd[((32 * idx) + cd))
                              static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                      gas gas_remaining wei
                                     args addr(cd)
                              mem[mem[64]] = ext_call.return_data[0]
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                              require return_data.size >= 32
                              if ext_call.return_data <= ext_call.return_data[0]:
                                  idx = idx + 1
                                  continue 
                              _1757 = mem[64]
                              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                              mem[mem[64] + 4] = 32
                              mem[mem[64] + 36] = 20
                              idx = 0
                              while idx < 20:
                                  mem[idx + _1757 + 68] = mem[idx + _1215 + 32]
                                  idx = idx + 32
                                  continue 
                              mem[_1757 + 68] = mem[_1757 + 80 len 20]
                              revert with memory
                                from mem[64]
                                 len _1757 + -mem[64] + 100
                          _1191 = mem[64]
                          mem[64] = mem[64] + 512
                          mem[_1191] = 16704
                          s = _1191
                          idx = 16
                          while idx - 1:
                              mem[s + 32] = 16704
                              s = s + 32
                              idx = idx - 1
                              continue 
                          _2161 = mem[64]
                          mem[64] = mem[64] + 512
                          mem[_2161] = 3383
                          mem[_2161 + 32] = 3404
                          mem[_2161 + 64] = 3439
                          mem[_2161 + 96] = 3452
                          mem[_2161 + 128] = 3480
                          mem[_2161 + 160] = 3514
                          mem[_2161 + 192] = 3548
                          mem[_2161 + 224] = 3582
                          mem[_2161 + 256] = 3595
                          mem[_2161 + 288] = 3623
                          mem[_2161 + 320] = 3636
                          mem[_2161 + 352] = 3649
                          mem[_2161 + 384] = 3662
                          mem[_2161 + 416] = 3690
                          mem[_2161 + 448] = 3724
                          mem[_2161 + 480] = 3737
                      else:
                          if addr(cd[((32 * idx - 1) + cd) == addr(cd[((32 * idx) + cd):
                              if idx != ('cd', 4).length - 1:
                                  require idx < ('cd', 4).length
                                  if addr(cd[((32 * idx) + cd):
                                      if addr(cd[((32 * idx) + cd) != 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee:
                                          mem[mem[64] + 4] = this.address
                                          require ext_code.size(addr(cd[((32 * idx) + cd))
                                          static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                                  gas gas_remaining wei
                                                 args addr(this.address)
                                          mem[mem[64]] = ext_call.return_data[0]
                                          if not ext_call.success:
                                              revert with ext_call.return_data[0 len return_data.size]
                                          require return_data.size >= 32
                                  idx = idx + 1
                                  continue 
                              _1216 = mem[64]
                              mem[64] = mem[64] + 64
                              mem[_1216] = 20
                              mem[_1216 + 32] = 0x737761704d756c746920737562206661696c6564000000000000000000000000
                              require idx < ('cd', 4).length
                              if not addr(cd[((32 * idx) + cd):
                                  if 0 <= eth.balance(cd[132]):
                                      idx = idx + 1
                                      continue 
                                  _1547 = mem[64]
                                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                  mem[mem[64] + 4] = 32
                                  mem[mem[64] + 36] = 20
                                  idx = 0
                                  while idx < 20:
                                      mem[idx + _1547 + 68] = mem[idx + _1216 + 32]
                                      idx = idx + 32
                                      continue 
                                  mem[_1547 + 68] = mem[_1547 + 80 len 20]
                                  revert with memory
                                    from mem[64]
                                     len _1547 + -mem[64] + 100
                              if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == addr(cd[((32 * idx) + cd):
                                  if 0 <= eth.balance(cd[132]):
                                      idx = idx + 1
                                      continue 
                                  _1550 = mem[64]
                                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                  mem[mem[64] + 4] = 32
                                  mem[mem[64] + 36] = 20
                                  idx = 0
                                  while idx < 20:
                                      mem[idx + _1550 + 68] = mem[idx + _1216 + 32]
                                      idx = idx + 32
                                      continue 
                                  mem[_1550 + 68] = mem[_1550 + 80 len 20]
                                  revert with memory
                                    from mem[64]
                                     len _1550 + -mem[64] + 100
                              mem[mem[64] + 4] = addr(cd)
                              require ext_code.size(addr(cd[((32 * idx) + cd))
                              static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                      gas gas_remaining wei
                                     args addr(cd)
                              mem[mem[64]] = ext_call.return_data[0]
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                              require return_data.size >= 32
                              if ext_call.return_data <= ext_call.return_data[0]:
                                  idx = idx + 1
                                  continue 
                              _1764 = mem[64]
                              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                              mem[mem[64] + 4] = 32
                              mem[mem[64] + 36] = 20
                              idx = 0
                              while idx < 20:
                                  mem[idx + _1764 + 68] = mem[idx + _1216 + 32]
                                  idx = idx + 32
                                  continue 
                              mem[_1764 + 68] = mem[_1764 + 80 len 20]
                              revert with memory
                                from mem[64]
                                 len _1764 + -mem[64] + 100
                          _1192 = mem[64]
                          mem[64] = mem[64] + 512
                          mem[_1192] = 16704
                          s = _1192
                          idx = 16
                          while idx - 1:
                              mem[s + 32] = 16704
                              s = s + 32
                              idx = idx - 1
                              continue 
                          _2169 = mem[64]
                          mem[64] = mem[64] + 512
                          mem[_2169] = 3383
                          mem[_2169 + 32] = 3404
                          mem[_2169 + 64] = 3439
                          mem[_2169 + 96] = 3452
                          mem[_2169 + 128] = 3480
                          mem[_2169 + 160] = 3514
                          mem[_2169 + 192] = 3548
                          mem[_2169 + 224] = 3582
                          mem[_2169 + 256] = 3595
                          mem[_2169 + 288] = 3623
                          mem[_2169 + 320] = 3636
                          mem[_2169 + 352] = 3649
                          mem[_2169 + 384] = 3662
                          mem[_2169 + 416] = 3690
                          mem[_2169 + 448] = 3724
                          mem[_2169 + 480] = 3737
              if mem[_412] > 16:
                  revert with 0, 
                              32,
                              63,
                              0x6453776170583a20446973747269627574696f6e2061727261792073686f756c64206e6f74206578636565642072657365727665732061727261792073697a,
                              mem[mem[64] + 131 len 1]
              ...  # Decompilation aborted, sorry: ("decompilation didn't finish",)
      else:
          mem[100] = addr(cd)
          require ext_code.size(addr(cd[((32 * ('cd', 4).length - 1) + cd))
          static call addr(cd[((32 * ('cd', 4).length - 1) + cd).balanceOf(address tokenOwner) with:
                  gas gas_remaining wei
                 args addr(cd)
          mem[96] = ext_call.return_data[0]
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          require return_data.size >= 32
          idx = 1
          while idx < ('cd', 4).length:
              require idx - 1 < ('cd', 4).length
              if addr(cd[((32 * idx - 1) + cd) == addr(cd[((32 * idx) + cd):
                  idx = idx + 1
                  continue 
              require ('cd', 100).length <= 18446744073709551615
              _411 = mem[64]
              mem[mem[64]] = ('cd', 100).length
              mem[64] = mem[64] + (32 * ('cd', 100).length) + 32
              if not ('cd', 100).length:
                  s = 0
                  while s < ('cd', 100).length:
                      require s < mem[_411]
                      mem[(32 * s) + _411 + 32] = 0
                      s = s + 1
                      continue 
                  require idx - 1 < ('cd', 4).length
                  require idx < ('cd', 4).length
                  if 1 == idx:
                      if idx == ('cd', 4).length - 1:
                          if addr(cd[((32 * idx - 1) + cd) == addr(cd[((32 * idx) + cd):
                              if idx != ('cd', 4).length - 1:
                                  require idx < ('cd', 4).length
                                  if addr(cd[((32 * idx) + cd):
                                      if addr(cd[((32 * idx) + cd) != 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee:
                                          mem[mem[64] + 4] = this.address
                                          require ext_code.size(addr(cd[((32 * idx) + cd))
                                          static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                                  gas gas_remaining wei
                                                 args addr(this.address)
                                          mem[mem[64]] = ext_call.return_data[0]
                                          if not ext_call.success:
                                              revert with ext_call.return_data[0 len return_data.size]
                                          require return_data.size >= 32
                                  idx = idx + 1
                                  continue 
                              _1201 = mem[64]
                              mem[64] = mem[64] + 64
                              mem[_1201] = 20
                              mem[_1201 + 32] = 0x737761704d756c746920737562206661696c6564000000000000000000000000
                              require idx < ('cd', 4).length
                              if not addr(cd[((32 * idx) + cd):
                                  if eth.balance(cd <= eth.balance(cd[132]):
                                      idx = idx + 1
                                      continue 
                                  _1457 = mem[64]
                                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                  mem[mem[64] + 4] = 32
                                  mem[mem[64] + 36] = 20
                                  idx = 0
                                  while idx < 20:
                                      mem[idx + _1457 + 68] = mem[idx + _1201 + 32]
                                      idx = idx + 32
                                      continue 
                                  mem[_1457 + 68] = mem[_1457 + 80 len 20]
                                  revert with memory
                                    from mem[64]
                                     len _1457 + -mem[64] + 100
                              if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == addr(cd[((32 * idx) + cd):
                                  if eth.balance(cd <= eth.balance(cd[132]):
                                      idx = idx + 1
                                      continue 
                                  _1460 = mem[64]
                                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                  mem[mem[64] + 4] = 32
                                  mem[mem[64] + 36] = 20
                                  idx = 0
                                  while idx < 20:
                                      mem[idx + _1460 + 68] = mem[idx + _1201 + 32]
                                      idx = idx + 32
                                      continue 
                                  mem[_1460 + 68] = mem[_1460 + 80 len 20]
                                  revert with memory
                                    from mem[64]
                                     len _1460 + -mem[64] + 100
                              mem[mem[64] + 4] = addr(cd)
                              require ext_code.size(addr(cd[((32 * idx) + cd))
                              static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                      gas gas_remaining wei
                                     args addr(cd)
                              mem[mem[64]] = ext_call.return_data[0]
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                              require return_data.size >= 32
                              if 0 <= ext_call.return_data[0]:
                                  idx = idx + 1
                                  continue 
                              _1659 = mem[64]
                              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                              mem[mem[64] + 4] = 32
                              mem[mem[64] + 36] = 20
                              idx = 0
                              while idx < 20:
                                  mem[idx + _1659 + 68] = mem[idx + _1201 + 32]
                                  idx = idx + 32
                                  continue 
                              mem[_1659 + 68] = mem[_1659 + 80 len 20]
                              revert with memory
                                from mem[64]
                                 len _1659 + -mem[64] + 100
                          _1177 = mem[64]
                          mem[64] = mem[64] + 512
                          mem[_1177] = 16704
                          s = _1177
                          idx = 16
                          while idx - 1:
                              mem[s + 32] = 16704
                              s = s + 32
                              idx = idx - 1
                              continue 
                          _2049 = mem[64]
                          mem[64] = mem[64] + 512
                          mem[_2049] = 3383
                          mem[_2049 + 32] = 3404
                          mem[_2049 + 64] = 3439
                          mem[_2049 + 96] = 3452
                          mem[_2049 + 128] = 3480
                          mem[_2049 + 160] = 3514
                          mem[_2049 + 192] = 3548
                          mem[_2049 + 224] = 3582
                          mem[_2049 + 256] = 3595
                          mem[_2049 + 288] = 3623
                          mem[_2049 + 320] = 3636
                          mem[_2049 + 352] = 3649
                          mem[_2049 + 384] = 3662
                          mem[_2049 + 416] = 3690
                          mem[_2049 + 448] = 3724
                          mem[_2049 + 480] = 3737
                      else:
                          if addr(cd[((32 * idx - 1) + cd) == addr(cd[((32 * idx) + cd):
                              if idx != ('cd', 4).length - 1:
                                  require idx < ('cd', 4).length
                                  if addr(cd[((32 * idx) + cd):
                                      if addr(cd[((32 * idx) + cd) != 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee:
                                          mem[mem[64] + 4] = this.address
                                          require ext_code.size(addr(cd[((32 * idx) + cd))
                                          static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                                  gas gas_remaining wei
                                                 args addr(this.address)
                                          mem[mem[64]] = ext_call.return_data[0]
                                          if not ext_call.success:
                                              revert with ext_call.return_data[0 len return_data.size]
                                          require return_data.size >= 32
                                  idx = idx + 1
                                  continue 
                              _1202 = mem[64]
                              mem[64] = mem[64] + 64
                              mem[_1202] = 20
                              mem[_1202 + 32] = 0x737761704d756c746920737562206661696c6564000000000000000000000000
                              require idx < ('cd', 4).length
                              if not addr(cd[((32 * idx) + cd):
                                  if eth.balance(cd <= eth.balance(cd[132]):
                                      idx = idx + 1
                                      continue 
                                  _1463 = mem[64]
                                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                  mem[mem[64] + 4] = 32
                                  mem[mem[64] + 36] = 20
                                  idx = 0
                                  while idx < 20:
                                      mem[idx + _1463 + 68] = mem[idx + _1202 + 32]
                                      idx = idx + 32
                                      continue 
                                  mem[_1463 + 68] = mem[_1463 + 80 len 20]
                                  revert with memory
                                    from mem[64]
                                     len _1463 + -mem[64] + 100
                              if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == addr(cd[((32 * idx) + cd):
                                  if eth.balance(cd <= eth.balance(cd[132]):
                                      idx = idx + 1
                                      continue 
                                  _1466 = mem[64]
                                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                  mem[mem[64] + 4] = 32
                                  mem[mem[64] + 36] = 20
                                  idx = 0
                                  while idx < 20:
                                      mem[idx + _1466 + 68] = mem[idx + _1202 + 32]
                                      idx = idx + 32
                                      continue 
                                  mem[_1466 + 68] = mem[_1466 + 80 len 20]
                                  revert with memory
                                    from mem[64]
                                     len _1466 + -mem[64] + 100
                              mem[mem[64] + 4] = addr(cd)
                              require ext_code.size(addr(cd[((32 * idx) + cd))
                              static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                      gas gas_remaining wei
                                     args addr(cd)
                              mem[mem[64]] = ext_call.return_data[0]
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                              require return_data.size >= 32
                              if 0 <= ext_call.return_data[0]:
                                  idx = idx + 1
                                  continue 
                              _1666 = mem[64]
                              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                              mem[mem[64] + 4] = 32
                              mem[mem[64] + 36] = 20
                              idx = 0
                              while idx < 20:
                                  mem[idx + _1666 + 68] = mem[idx + _1202 + 32]
                                  idx = idx + 32
                                  continue 
                              mem[_1666 + 68] = mem[_1666 + 80 len 20]
                              revert with memory
                                from mem[64]
                                 len _1666 + -mem[64] + 100
                          _1178 = mem[64]
                          mem[64] = mem[64] + 512
                          mem[_1178] = 16704
                          s = _1178
                          idx = 16
                          while idx - 1:
                              mem[s + 32] = 16704
                              s = s + 32
                              idx = idx - 1
                              continue 
                          _2057 = mem[64]
                          mem[64] = mem[64] + 512
                          mem[_2057] = 3383
                          mem[_2057 + 32] = 3404
                          mem[_2057 + 64] = 3439
                          mem[_2057 + 96] = 3452
                          mem[_2057 + 128] = 3480
                          mem[_2057 + 160] = 3514
                          mem[_2057 + 192] = 3548
                          mem[_2057 + 224] = 3582
                          mem[_2057 + 256] = 3595
                          mem[_2057 + 288] = 3623
                          mem[_2057 + 320] = 3636
                          mem[_2057 + 352] = 3649
                          mem[_2057 + 384] = 3662
                          mem[_2057 + 416] = 3690
                          mem[_2057 + 448] = 3724
                          mem[_2057 + 480] = 3737
                  else:
                      if idx == ('cd', 4).length - 1:
                          if addr(cd[((32 * idx - 1) + cd) == addr(cd[((32 * idx) + cd):
                              if idx != ('cd', 4).length - 1:
                                  require idx < ('cd', 4).length
                                  if addr(cd[((32 * idx) + cd):
                                      if addr(cd[((32 * idx) + cd) != 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee:
                                          mem[mem[64] + 4] = this.address
                                          require ext_code.size(addr(cd[((32 * idx) + cd))
                                          static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                                  gas gas_remaining wei
                                                 args addr(this.address)
                                          mem[mem[64]] = ext_call.return_data[0]
                                          if not ext_call.success:
                                              revert with ext_call.return_data[0 len return_data.size]
                                          require return_data.size >= 32
                                  idx = idx + 1
                                  continue 
                              _1203 = mem[64]
                              mem[64] = mem[64] + 64
                              mem[_1203] = 20
                              mem[_1203 + 32] = 0x737761704d756c746920737562206661696c6564000000000000000000000000
                              require idx < ('cd', 4).length
                              if not addr(cd[((32 * idx) + cd):
                                  if eth.balance(cd <= eth.balance(cd[132]):
                                      idx = idx + 1
                                      continue 
                                  _1469 = mem[64]
                                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                  mem[mem[64] + 4] = 32
                                  mem[mem[64] + 36] = 20
                                  idx = 0
                                  while idx < 20:
                                      mem[idx + _1469 + 68] = mem[idx + _1203 + 32]
                                      idx = idx + 32
                                      continue 
                                  mem[_1469 + 68] = mem[_1469 + 80 len 20]
                                  revert with memory
                                    from mem[64]
                                     len _1469 + -mem[64] + 100
                              if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == addr(cd[((32 * idx) + cd):
                                  if eth.balance(cd <= eth.balance(cd[132]):
                                      idx = idx + 1
                                      continue 
                                  _1472 = mem[64]
                                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                  mem[mem[64] + 4] = 32
                                  mem[mem[64] + 36] = 20
                                  idx = 0
                                  while idx < 20:
                                      mem[idx + _1472 + 68] = mem[idx + _1203 + 32]
                                      idx = idx + 32
                                      continue 
                                  mem[_1472 + 68] = mem[_1472 + 80 len 20]
                                  revert with memory
                                    from mem[64]
                                     len _1472 + -mem[64] + 100
                              mem[mem[64] + 4] = addr(cd)
                              require ext_code.size(addr(cd[((32 * idx) + cd))
                              static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                      gas gas_remaining wei
                                     args addr(cd)
                              mem[mem[64]] = ext_call.return_data[0]
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                              require return_data.size >= 32
                              if 0 <= ext_call.return_data[0]:
                                  idx = idx + 1
                                  continue 
                              _1673 = mem[64]
                              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                              mem[mem[64] + 4] = 32
                              mem[mem[64] + 36] = 20
                              idx = 0
                              while idx < 20:
                                  mem[idx + _1673 + 68] = mem[idx + _1203 + 32]
                                  idx = idx + 32
                                  continue 
                              mem[_1673 + 68] = mem[_1673 + 80 len 20]
                              revert with memory
                                from mem[64]
                                 len _1673 + -mem[64] + 100
                          _1179 = mem[64]
                          mem[64] = mem[64] + 512
                          mem[_1179] = 16704
                          s = _1179
                          idx = 16
                          while idx - 1:
                              mem[s + 32] = 16704
                              s = s + 32
                              idx = idx - 1
                              continue 
                          _2065 = mem[64]
                          mem[64] = mem[64] + 512
                          mem[_2065] = 3383
                          mem[_2065 + 32] = 3404
                          mem[_2065 + 64] = 3439
                          mem[_2065 + 96] = 3452
                          mem[_2065 + 128] = 3480
                          mem[_2065 + 160] = 3514
                          mem[_2065 + 192] = 3548
                          mem[_2065 + 224] = 3582
                          mem[_2065 + 256] = 3595
                          mem[_2065 + 288] = 3623
                          mem[_2065 + 320] = 3636
                          mem[_2065 + 352] = 3649
                          mem[_2065 + 384] = 3662
                          mem[_2065 + 416] = 3690
                          mem[_2065 + 448] = 3724
                          mem[_2065 + 480] = 3737
                      else:
                          if addr(cd[((32 * idx - 1) + cd) == addr(cd[((32 * idx) + cd):
                              if idx != ('cd', 4).length - 1:
                                  require idx < ('cd', 4).length
                                  if addr(cd[((32 * idx) + cd):
                                      if addr(cd[((32 * idx) + cd) != 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee:
                                          mem[mem[64] + 4] = this.address
                                          require ext_code.size(addr(cd[((32 * idx) + cd))
                                          static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                                  gas gas_remaining wei
                                                 args addr(this.address)
                                          mem[mem[64]] = ext_call.return_data[0]
                                          if not ext_call.success:
                                              revert with ext_call.return_data[0 len return_data.size]
                                          require return_data.size >= 32
                                  idx = idx + 1
                                  continue 
                              _1204 = mem[64]
                              mem[64] = mem[64] + 64
                              mem[_1204] = 20
                              mem[_1204 + 32] = 0x737761704d756c746920737562206661696c6564000000000000000000000000
                              require idx < ('cd', 4).length
                              if not addr(cd[((32 * idx) + cd):
                                  if eth.balance(cd <= eth.balance(cd[132]):
                                      idx = idx + 1
                                      continue 
                                  _1475 = mem[64]
                                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                  mem[mem[64] + 4] = 32
                                  mem[mem[64] + 36] = 20
                                  idx = 0
                                  while idx < 20:
                                      mem[idx + _1475 + 68] = mem[idx + _1204 + 32]
                                      idx = idx + 32
                                      continue 
                                  mem[_1475 + 68] = mem[_1475 + 80 len 20]
                                  revert with memory
                                    from mem[64]
                                     len _1475 + -mem[64] + 100
                              if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == addr(cd[((32 * idx) + cd):
                                  if eth.balance(cd <= eth.balance(cd[132]):
                                      idx = idx + 1
                                      continue 
                                  _1478 = mem[64]
                                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                  mem[mem[64] + 4] = 32
                                  mem[mem[64] + 36] = 20
                                  idx = 0
                                  while idx < 20:
                                      mem[idx + _1478 + 68] = mem[idx + _1204 + 32]
                                      idx = idx + 32
                                      continue 
                                  mem[_1478 + 68] = mem[_1478 + 80 len 20]
                                  revert with memory
                                    from mem[64]
                                     len _1478 + -mem[64] + 100
                              mem[mem[64] + 4] = addr(cd)
                              require ext_code.size(addr(cd[((32 * idx) + cd))
                              static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                      gas gas_remaining wei
                                     args addr(cd)
                              mem[mem[64]] = ext_call.return_data[0]
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                              require return_data.size >= 32
                              if 0 <= ext_call.return_data[0]:
                                  idx = idx + 1
                                  continue 
                              _1680 = mem[64]
                              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                              mem[mem[64] + 4] = 32
                              mem[mem[64] + 36] = 20
                              idx = 0
                              while idx < 20:
                                  mem[idx + _1680 + 68] = mem[idx + _1204 + 32]
                                  idx = idx + 32
                                  continue 
                              mem[_1680 + 68] = mem[_1680 + 80 len 20]
                              revert with memory
                                from mem[64]
                                 len _1680 + -mem[64] + 100
                          _1180 = mem[64]
                          mem[64] = mem[64] + 512
                          mem[_1180] = 16704
                          s = _1180
                          idx = 16
                          while idx - 1:
                              mem[s + 32] = 16704
                              s = s + 32
                              idx = idx - 1
                              continue 
                          _2073 = mem[64]
                          mem[64] = mem[64] + 512
                          mem[_2073] = 3383
                          mem[_2073 + 32] = 3404
                          mem[_2073 + 64] = 3439
                          mem[_2073 + 96] = 3452
                          mem[_2073 + 128] = 3480
                          mem[_2073 + 160] = 3514
                          mem[_2073 + 192] = 3548
                          mem[_2073 + 224] = 3582
                          mem[_2073 + 256] = 3595
                          mem[_2073 + 288] = 3623
                          mem[_2073 + 320] = 3636
                          mem[_2073 + 352] = 3649
                          mem[_2073 + 384] = 3662
                          mem[_2073 + 416] = 3690
                          mem[_2073 + 448] = 3724
                          mem[_2073 + 480] = 3737
              else:
                  mem[_411 + 32 len 32 * ('cd', 100).length] = call.data[calldata.size len 32 * ('cd', 100).length]
                  s = 0
                  while s < ('cd', 100).length:
                      require s < mem[_411]
                      mem[(32 * s) + _411 + 32] = 0
                      s = s + 1
                      continue 
                  require idx - 1 < ('cd', 4).length
                  require idx < ('cd', 4).length
                  if 1 == idx:
                      if idx == ('cd', 4).length - 1:
                          if addr(cd[((32 * idx - 1) + cd) == addr(cd[((32 * idx) + cd):
                              if idx != ('cd', 4).length - 1:
                                  require idx < ('cd', 4).length
                                  if addr(cd[((32 * idx) + cd):
                                      if addr(cd[((32 * idx) + cd) != 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee:
                                          mem[mem[64] + 4] = this.address
                                          require ext_code.size(addr(cd[((32 * idx) + cd))
                                          static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                                  gas gas_remaining wei
                                                 args addr(this.address)
                                          mem[mem[64]] = ext_call.return_data[0]
                                          if not ext_call.success:
                                              revert with ext_call.return_data[0 len return_data.size]
                                          require return_data.size >= 32
                                  idx = idx + 1
                                  continue 
                              _1205 = mem[64]
                              mem[64] = mem[64] + 64
                              mem[_1205] = 20
                              mem[_1205 + 32] = 0x737761704d756c746920737562206661696c6564000000000000000000000000
                              require idx < ('cd', 4).length
                              if not addr(cd[((32 * idx) + cd):
                                  if eth.balance(cd <= eth.balance(cd[132]):
                                      idx = idx + 1
                                      continue 
                                  _1481 = mem[64]
                                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                  mem[mem[64] + 4] = 32
                                  mem[mem[64] + 36] = 20
                                  idx = 0
                                  while idx < 20:
                                      mem[idx + _1481 + 68] = mem[idx + _1205 + 32]
                                      idx = idx + 32
                                      continue 
                                  mem[_1481 + 68] = mem[_1481 + 80 len 20]
                                  revert with memory
                                    from mem[64]
                                     len _1481 + -mem[64] + 100
                              if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == addr(cd[((32 * idx) + cd):
                                  if eth.balance(cd <= eth.balance(cd[132]):
                                      idx = idx + 1
                                      continue 
                                  _1484 = mem[64]
                                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                  mem[mem[64] + 4] = 32
                                  mem[mem[64] + 36] = 20
                                  idx = 0
                                  while idx < 20:
                                      mem[idx + _1484 + 68] = mem[idx + _1205 + 32]
                                      idx = idx + 32
                                      continue 
                                  mem[_1484 + 68] = mem[_1484 + 80 len 20]
                                  revert with memory
                                    from mem[64]
                                     len _1484 + -mem[64] + 100
                              mem[mem[64] + 4] = addr(cd)
                              require ext_code.size(addr(cd[((32 * idx) + cd))
                              static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                      gas gas_remaining wei
                                     args addr(cd)
                              mem[mem[64]] = ext_call.return_data[0]
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                              require return_data.size >= 32
                              if 0 <= ext_call.return_data[0]:
                                  idx = idx + 1
                                  continue 
                              _1687 = mem[64]
                              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                              mem[mem[64] + 4] = 32
                              mem[mem[64] + 36] = 20
                              idx = 0
                              while idx < 20:
                                  mem[idx + _1687 + 68] = mem[idx + _1205 + 32]
                                  idx = idx + 32
                                  continue 
                              mem[_1687 + 68] = mem[_1687 + 80 len 20]
                              revert with memory
                                from mem[64]
                                 len _1687 + -mem[64] + 100
                          _1181 = mem[64]
                          mem[64] = mem[64] + 512
                          mem[_1181] = 16704
                          s = _1181
                          idx = 16
                          while idx - 1:
                              mem[s + 32] = 16704
                              s = s + 32
                              idx = idx - 1
                              continue 
                          _2081 = mem[64]
                          mem[64] = mem[64] + 512
                          mem[_2081] = 3383
                          mem[_2081 + 32] = 3404
                          mem[_2081 + 64] = 3439
                          mem[_2081 + 96] = 3452
                          mem[_2081 + 128] = 3480
                          mem[_2081 + 160] = 3514
                          mem[_2081 + 192] = 3548
                          mem[_2081 + 224] = 3582
                          mem[_2081 + 256] = 3595
                          mem[_2081 + 288] = 3623
                          mem[_2081 + 320] = 3636
                          mem[_2081 + 352] = 3649
                          mem[_2081 + 384] = 3662
                          mem[_2081 + 416] = 3690
                          mem[_2081 + 448] = 3724
                          mem[_2081 + 480] = 3737
                      else:
                          if addr(cd[((32 * idx - 1) + cd) == addr(cd[((32 * idx) + cd):
                              if idx != ('cd', 4).length - 1:
                                  require idx < ('cd', 4).length
                                  if addr(cd[((32 * idx) + cd):
                                      if addr(cd[((32 * idx) + cd) != 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee:
                                          mem[mem[64] + 4] = this.address
                                          require ext_code.size(addr(cd[((32 * idx) + cd))
                                          static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                                  gas gas_remaining wei
                                                 args addr(this.address)
                                          mem[mem[64]] = ext_call.return_data[0]
                                          if not ext_call.success:
                                              revert with ext_call.return_data[0 len return_data.size]
                                          require return_data.size >= 32
                                  idx = idx + 1
                                  continue 
                              _1206 = mem[64]
                              mem[64] = mem[64] + 64
                              mem[_1206] = 20
                              mem[_1206 + 32] = 0x737761704d756c746920737562206661696c6564000000000000000000000000
                              require idx < ('cd', 4).length
                              if not addr(cd[((32 * idx) + cd):
                                  if eth.balance(cd <= eth.balance(cd[132]):
                                      idx = idx + 1
                                      continue 
                                  _1487 = mem[64]
                                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                  mem[mem[64] + 4] = 32
                                  mem[mem[64] + 36] = 20
                                  idx = 0
                                  while idx < 20:
                                      mem[idx + _1487 + 68] = mem[idx + _1206 + 32]
                                      idx = idx + 32
                                      continue 
                                  mem[_1487 + 68] = mem[_1487 + 80 len 20]
                                  revert with memory
                                    from mem[64]
                                     len _1487 + -mem[64] + 100
                              if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == addr(cd[((32 * idx) + cd):
                                  if eth.balance(cd <= eth.balance(cd[132]):
                                      idx = idx + 1
                                      continue 
                                  _1490 = mem[64]
                                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                  mem[mem[64] + 4] = 32
                                  mem[mem[64] + 36] = 20
                                  idx = 0
                                  while idx < 20:
                                      mem[idx + _1490 + 68] = mem[idx + _1206 + 32]
                                      idx = idx + 32
                                      continue 
                                  mem[_1490 + 68] = mem[_1490 + 80 len 20]
                                  revert with memory
                                    from mem[64]
                                     len _1490 + -mem[64] + 100
                              mem[mem[64] + 4] = addr(cd)
                              require ext_code.size(addr(cd[((32 * idx) + cd))
                              static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                      gas gas_remaining wei
                                     args addr(cd)
                              mem[mem[64]] = ext_call.return_data[0]
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                              require return_data.size >= 32
                              if 0 <= ext_call.return_data[0]:
                                  idx = idx + 1
                                  continue 
                              _1694 = mem[64]
                              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                              mem[mem[64] + 4] = 32
                              mem[mem[64] + 36] = 20
                              idx = 0
                              while idx < 20:
                                  mem[idx + _1694 + 68] = mem[idx + _1206 + 32]
                                  idx = idx + 32
                                  continue 
                              mem[_1694 + 68] = mem[_1694 + 80 len 20]
                              revert with memory
                                from mem[64]
                                 len _1694 + -mem[64] + 100
                          _1182 = mem[64]
                          mem[64] = mem[64] + 512
                          mem[_1182] = 16704
                          s = _1182
                          idx = 16
                          while idx - 1:
                              mem[s + 32] = 16704
                              s = s + 32
                              idx = idx - 1
                              continue 
                          _2089 = mem[64]
                          mem[64] = mem[64] + 512
                          mem[_2089] = 3383
                          mem[_2089 + 32] = 3404
                          mem[_2089 + 64] = 3439
                          mem[_2089 + 96] = 3452
                          mem[_2089 + 128] = 3480
                          mem[_2089 + 160] = 3514
                          mem[_2089 + 192] = 3548
                          mem[_2089 + 224] = 3582
                          mem[_2089 + 256] = 3595
                          mem[_2089 + 288] = 3623
                          mem[_2089 + 320] = 3636
                          mem[_2089 + 352] = 3649
                          mem[_2089 + 384] = 3662
                          mem[_2089 + 416] = 3690
                          mem[_2089 + 448] = 3724
                          mem[_2089 + 480] = 3737
                  else:
                      if idx == ('cd', 4).length - 1:
                          if addr(cd[((32 * idx - 1) + cd) == addr(cd[((32 * idx) + cd):
                              if idx != ('cd', 4).length - 1:
                                  require idx < ('cd', 4).length
                                  if addr(cd[((32 * idx) + cd):
                                      if addr(cd[((32 * idx) + cd) != 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee:
                                          mem[mem[64] + 4] = this.address
                                          require ext_code.size(addr(cd[((32 * idx) + cd))
                                          static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                                  gas gas_remaining wei
                                                 args addr(this.address)
                                          mem[mem[64]] = ext_call.return_data[0]
                                          if not ext_call.success:
                                              revert with ext_call.return_data[0 len return_data.size]
                                          require return_data.size >= 32
                                  idx = idx + 1
                                  continue 
                              _1207 = mem[64]
                              mem[64] = mem[64] + 64
                              mem[_1207] = 20
                              mem[_1207 + 32] = 0x737761704d756c746920737562206661696c6564000000000000000000000000
                              require idx < ('cd', 4).length
                              if not addr(cd[((32 * idx) + cd):
                                  if eth.balance(cd <= eth.balance(cd[132]):
                                      idx = idx + 1
                                      continue 
                                  _1493 = mem[64]
                                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                  mem[mem[64] + 4] = 32
                                  mem[mem[64] + 36] = 20
                                  idx = 0
                                  while idx < 20:
                                      mem[idx + _1493 + 68] = mem[idx + _1207 + 32]
                                      idx = idx + 32
                                      continue 
                                  mem[_1493 + 68] = mem[_1493 + 80 len 20]
                                  revert with memory
                                    from mem[64]
                                     len _1493 + -mem[64] + 100
                              if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == addr(cd[((32 * idx) + cd):
                                  if eth.balance(cd <= eth.balance(cd[132]):
                                      idx = idx + 1
                                      continue 
                                  _1496 = mem[64]
                                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                  mem[mem[64] + 4] = 32
                                  mem[mem[64] + 36] = 20
                                  idx = 0
                                  while idx < 20:
                                      mem[idx + _1496 + 68] = mem[idx + _1207 + 32]
                                      idx = idx + 32
                                      continue 
                                  mem[_1496 + 68] = mem[_1496 + 80 len 20]
                                  revert with memory
                                    from mem[64]
                                     len _1496 + -mem[64] + 100
                              mem[mem[64] + 4] = addr(cd)
                              require ext_code.size(addr(cd[((32 * idx) + cd))
                              static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                      gas gas_remaining wei
                                     args addr(cd)
                              mem[mem[64]] = ext_call.return_data[0]
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                              require return_data.size >= 32
                              if 0 <= ext_call.return_data[0]:
                                  idx = idx + 1
                                  continue 
                              _1701 = mem[64]
                              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                              mem[mem[64] + 4] = 32
                              mem[mem[64] + 36] = 20
                              idx = 0
                              while idx < 20:
                                  mem[idx + _1701 + 68] = mem[idx + _1207 + 32]
                                  idx = idx + 32
                                  continue 
                              mem[_1701 + 68] = mem[_1701 + 80 len 20]
                              revert with memory
                                from mem[64]
                                 len _1701 + -mem[64] + 100
                          _1183 = mem[64]
                          mem[64] = mem[64] + 512
                          mem[_1183] = 16704
                          s = _1183
                          idx = 16
                          while idx - 1:
                              mem[s + 32] = 16704
                              s = s + 32
                              idx = idx - 1
                              continue 
                          _2097 = mem[64]
                          mem[64] = mem[64] + 512
                          mem[_2097] = 3383
                          mem[_2097 + 32] = 3404
                          mem[_2097 + 64] = 3439
                          mem[_2097 + 96] = 3452
                          mem[_2097 + 128] = 3480
                          mem[_2097 + 160] = 3514
                          mem[_2097 + 192] = 3548
                          mem[_2097 + 224] = 3582
                          mem[_2097 + 256] = 3595
                          mem[_2097 + 288] = 3623
                          mem[_2097 + 320] = 3636
                          mem[_2097 + 352] = 3649
                          mem[_2097 + 384] = 3662
                          mem[_2097 + 416] = 3690
                          mem[_2097 + 448] = 3724
                          mem[_2097 + 480] = 3737
                      else:
                          if addr(cd[((32 * idx - 1) + cd) == addr(cd[((32 * idx) + cd):
                              if idx != ('cd', 4).length - 1:
                                  require idx < ('cd', 4).length
                                  if addr(cd[((32 * idx) + cd):
                                      if addr(cd[((32 * idx) + cd) != 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee:
                                          mem[mem[64] + 4] = this.address
                                          require ext_code.size(addr(cd[((32 * idx) + cd))
                                          static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                                  gas gas_remaining wei
                                                 args addr(this.address)
                                          mem[mem[64]] = ext_call.return_data[0]
                                          if not ext_call.success:
                                              revert with ext_call.return_data[0 len return_data.size]
                                          require return_data.size >= 32
                                  idx = idx + 1
                                  continue 
                              _1208 = mem[64]
                              mem[64] = mem[64] + 64
                              mem[_1208] = 20
                              mem[_1208 + 32] = 0x737761704d756c746920737562206661696c6564000000000000000000000000
                              require idx < ('cd', 4).length
                              if not addr(cd[((32 * idx) + cd):
                                  if eth.balance(cd <= eth.balance(cd[132]):
                                      idx = idx + 1
                                      continue 
                                  _1499 = mem[64]
                                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                  mem[mem[64] + 4] = 32
                                  mem[mem[64] + 36] = 20
                                  idx = 0
                                  while idx < 20:
                                      mem[idx + _1499 + 68] = mem[idx + _1208 + 32]
                                      idx = idx + 32
                                      continue 
                                  mem[_1499 + 68] = mem[_1499 + 80 len 20]
                                  revert with memory
                                    from mem[64]
                                     len _1499 + -mem[64] + 100
                              if 0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee == addr(cd[((32 * idx) + cd):
                                  if eth.balance(cd <= eth.balance(cd[132]):
                                      idx = idx + 1
                                      continue 
                                  _1502 = mem[64]
                                  mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                                  mem[mem[64] + 4] = 32
                                  mem[mem[64] + 36] = 20
                                  idx = 0
                                  while idx < 20:
                                      mem[idx + _1502 + 68] = mem[idx + _1208 + 32]
                                      idx = idx + 32
                                      continue 
                                  mem[_1502 + 68] = mem[_1502 + 80 len 20]
                                  revert with memory
                                    from mem[64]
                                     len _1502 + -mem[64] + 100
                              mem[mem[64] + 4] = addr(cd)
                              require ext_code.size(addr(cd[((32 * idx) + cd))
                              static call addr(cd[((32 * idx) + cd).balanceOf(address tokenOwner) with:
                                      gas gas_remaining wei
                                     args addr(cd)
                              mem[mem[64]] = ext_call.return_data[0]
                              if not ext_call.success:
                                  revert with ext_call.return_data[0 len return_data.size]
                              require return_data.size >= 32
                              if 0 <= ext_call.return_data[0]:
                                  idx = idx + 1
                                  continue 
                              _1708 = mem[64]
                              mem[mem[64]] = 0x8c379a000000000000000000000000000000000000000000000000000000000
                              mem[mem[64] + 4] = 32
                              mem[mem[64] + 36] = 20
                              idx = 0
                              while idx < 20:
                                  mem[idx + _1708 + 68] = mem[idx + _1208 + 32]
                                  idx = idx + 32
                                  continue 
                              mem[_1708 + 68] = mem[_1708 + 80 len 20]
                              revert with memory
                                from mem[64]
                                 len _1708 + -mem[64] + 100
                          _1184 = mem[64]
                          mem[64] = mem[64] + 512
                          mem[_1184] = 16704
                          s = _1184
                          idx = 16
                          while idx - 1:
                              mem[s + 32] = 16704
                              s = s + 32
                              idx = idx - 1
                              continue 
                          _2105 = mem[64]
                          mem[64] = mem[64] + 512
                          mem[_2105] = 3383
                          mem[_2105 + 32] = 3404
                          mem[_2105 + 64] = 3439
                          mem[_2105 + 96] = 3452
                          mem[_2105 + 128] = 3480
                          mem[_2105 + 160] = 3514
                          mem[_2105 + 192] = 3548
                          mem[_2105 + 224] = 3582
                          mem[_2105 + 256] = 3595
                          mem[_2105 + 288] = 3623
                          mem[_2105 + 320] = 3636
                          mem[_2105 + 352] = 3649
                          mem[_2105 + 384] = 3662
                          mem[_2105 + 416] = 3690
                          mem[_2105 + 448] = 3724
                          mem[_2105 + 480] = 3737
              if mem[_411] > 16:
                  revert with 0, 
                              32,
                              63,
                              0x6453776170583a20446973747269627574696f6e2061727261792073686f756c64206e6f74206578636565642072657365727665732061727261792073697a,
                              mem[mem[64] + 131 len 1]
              ...  # Decompilation aborted, sorry: ("decompilation didn't finish",)
  if cd < cd[68]:
      revert with 0, 32, 34, 0x7353776170583a2052657475726e20616d6f756e74206973206e6f7420656e6f7567, mem[mem[64] + 102 len 30]
  return cd[36]