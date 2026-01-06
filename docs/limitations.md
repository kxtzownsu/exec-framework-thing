# limitations

## minios
Due to MiniOS' RootFS being stored inside the kernel (initramfs) and signed, <br /> 
we aren't able to modify it. Therefore, we store our data on the now-unused <br /> 
partition 12 (64MB) & have the user mount it.

## shim
You can't boot shims on keyrolled devices. 

## recovery
unsure, will add more later
