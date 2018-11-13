#define HL_NAME(n) hlib_##n

#include <hl.h>

typedef struct _result hlib_result;

struct _result {
	vbyte *name;
	int age;
};

HL_PRIM vbyte *HL_NAME(hello_name)( vbyte* name ) {
	hl_buffer *b = hl_alloc_buffer();
	hl_buffer_str(b, USTR("Egun on, "));
	hl_buffer_str(b,  (uchar*)name);
	hl_buffer_str(b, USTR("!"));
	
	return (vbyte*)hl_buffer_content(b,NULL);
}

HL_PRIM hlib_result *HL_NAME(request_result)( vbyte* name, int birthYear, int currentYear ) {
	
	hlib_result *cr = (hlib_result*)hl_gc_alloc_finalizer(sizeof(hlib_result));
	
	cr->name = HL_NAME(hello_name)(name);
	cr->age = currentYear - birthYear;
	
	return cr;
}

HL_PRIM hlib_result *HL_NAME(get_haxe_object)( vbyte* name, int birthYear, int currentYear ) {
	return HL_NAME(request_result)(name, birthYear, currentYear);
}

HL_PRIM vbyte *HL_NAME(result_name)( hlib_result* cr) {
	return cr->name;
}

HL_PRIM int HL_NAME(result_age)( hlib_result* cr) {
	return cr->age;
}

#define _RESULT _ABSTRACT( hlib_result )


DEFINE_PRIM(_BYTES, 	hello_name, 		_BYTES);
DEFINE_PRIM(_RESULT,   	request_result, 	_BYTES _I32 _I32);
DEFINE_PRIM(_DYN,   	get_haxe_object, 	_BYTES _I32 _I32);
DEFINE_PRIM(_BYTES, 	result_name, 		_RESULT);
DEFINE_PRIM(_I32, 		result_age, 		_RESULT);
