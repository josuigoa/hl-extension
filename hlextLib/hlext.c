#define HL_NAME(n) hlext_##n

#include <hl.h>

typedef struct _result hlext_result;

struct _result {
	vbyte *greeting;
	int age;
};

HL_PRIM hlext_result *HL_NAME(request_result)( vbyte* name, int birthYear, int currentYear ) {
	
	hlext_result *cr = (hlext_result*)hl_gc_alloc_finalizer(sizeof(hlext_result));
	
	hl_buffer *b = hl_alloc_buffer();
	hl_buffer_str(b, USTR("Egun on, "));
	hl_buffer_str(b,  (uchar*)name);
	hl_buffer_str(b, USTR("!"));
	
	cr->greeting = (vbyte*)hl_buffer_content(b, NULL);
	cr->age = currentYear - birthYear;
	
	return cr;
}

HL_PRIM vdynamic *HL_NAME(get_haxe_object)( vbyte* name, int birthYear, int currentYear ) {
	hlext_result *cr = HL_NAME(request_result)(name, birthYear, currentYear);
	
	// allocate new dynamic object
	vdynamic *obj = (vdynamic*)hl_alloc_dynobj();
	// set field called "age" of 'obj' object of type 'int' with the cr->age value
	// hl_hash_gen(hl_to_utf16("age"), true): get the numeric represenation of the field name
	hl_dyn_seti(obj, hl_hash_gen(hl_to_utf16("age"), true), &hlt_i32, cr->age);
	
	// set field called "name" of 'obj' object of type 'vbyte' with the cr->name value
	// hl_hash_gen(hl_to_utf16("greeting"), true): get the numeric represenation of the field name
	hl_dyn_setp(obj, hl_hash_gen(hl_to_utf16("greeting"), true), &hlt_bytes, cr->greeting);
	
	return obj;
}

HL_PRIM vbyte *HL_NAME(result_greeting)( hlext_result* cr) {
	return cr->greeting;
}

HL_PRIM int HL_NAME(result_age)( hlext_result* cr) {
	return cr->age;
}

#define _RESULT _ABSTRACT( hlext_result )


DEFINE_PRIM(_RESULT,   	request_result, 	_BYTES _I32 _I32);
DEFINE_PRIM(_DYN,   	get_haxe_object, 	_BYTES _I32 _I32);
DEFINE_PRIM(_BYTES, 	result_greeting, 	_RESULT);
DEFINE_PRIM(_I32, 		result_age, 		_RESULT);
