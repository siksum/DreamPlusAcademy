# Palkeoramix decompiler. 

def storage:
  owner is addr at storage 0
  poolAddress is addr at storage 1
  count is uint256 at storage 2
  adminAddress is addr at storage 3

def count() payable: 
  return count

def pool() payable: 
  return poolAddress

def owner() payable: 
  return owner

def admin() payable: 
  return adminAddress

#
#  Regular functions
#

def _fallback() payable: # default function
  revert

def isOwner() payable: 
  return (caller == owner)

def renounceOwnership() payable: 
  require caller == owner
  log OwnershipRenounced(address previousOwner=owner)
  owner = 0

def transferOwnership(address _newOwner) payable: 
  require calldata.size - 4 >= 32
  require caller == owner
  require _newOwner
  log OwnershipTransferred(
        address previousOwner=owner,
        address newOwner=_newOwner)
  owner = _newOwner

def unknown4a0b0c38() payable: 
  require ext_code.size(poolAddress)
  call poolAddress.0x2e2d2984 with:
       gas gas_remaining wei
      args 100000000 * 10^18, addr(this.address), adminAddress
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32

def unknown2e88fb97() payable: 
  require calldata.size - 4 >= 96
  count++
  if count < 2:
      require ext_code.size(poolAddress)
      call poolAddress.0x2e2d2984 with:
           gas gas_remaining wei
          args 100000000 * 10^18, addr(this.address), adminAddress
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      require return_data.size >= 32