ENTRY( _vector_table )

__stack_size = 512;

PROVIDE( _stack_size = __stack_size );

MEMORY
{
	FLASH (rx)  : ORIGIN = 0x58002000, LENGTH = 8K
	RAM   (xrw) : ORIGIN = 0x22024000, LENGTH = 2K
}

/* put gp at start of RAM as we only have 2KB */
__global_pointer = 0x22024000;

SECTIONS
{
	.text :
	{
		. = ALIGN(4);
        __text_code_start__ = .;

		KEEP (*(SORT_NONE(.vector)))

		/* All general text sections */
		*(.text.*)

		/* All rodata */
		*(.rodata.*)
		
		. = ALIGN(4); /* Ensure next section is 4 byte aligned */
	} > FLASH

	.data :
  {
		_sdata = .;

    /* All general data section */
    *(.data.*)
    *(.sdata.*)

		_edata = .;
  }> RAM AT>FLASH

	.bss :
  {
		_sbss = .;

    /* All general data section */
    *(.bss)

		_ebss = .;
  } > RAM

	.stack ORIGIN(RAM) + LENGTH(RAM) - __stack_size :
	{
	    . = ALIGN(4);

	    . = . + __stack_size;

	    _eusrstack = .;
	} >RAM

}


_data_loadaddr = LOADADDR(.data);
_data_size = SIZEOF(.data);
