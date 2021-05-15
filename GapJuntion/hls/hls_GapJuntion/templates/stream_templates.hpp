//Bus Sizes_____________________________________________________________________

template< typename T>
struct dataPackage32 {
 	T data;
    ap_int<1> tlast;
};

template< typename T,int dataQuantity>

struct dataPackage {
 	T data[dataQuantity];
};


//Structs_______________________________________________________________________
