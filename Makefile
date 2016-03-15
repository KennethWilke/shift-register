all: test_shift_register_default test_shift_register_8bit test_shift_register_delayed test_shift_register_16bit_delayed

test_shift_register_default: shift_register.sv tests/test_default.sv
	xvlog --sv $^ 
	xelab $@
	xsim -R $@ | bash detect_error.sh

test_shift_register_8bit: shift_register.sv tests/test_8bit.sv
	xvlog --sv $^ 
	xelab $@
	xsim -R $@ | bash detect_error.sh

test_shift_register_16bit_delayed: shift_register.sv tests/test_16bit_delayed.sv
	xvlog --sv $^ 
	xelab $@
	xsim -R $@ | bash detect_error.sh

test_shift_register_delayed: shift_register.sv tests/test_delayed.sv
	xvlog --sv $^ 
	xelab $@
	xsim -R $@ | bash detect_error.sh

clean:
	rm -fr webtalk* xelab* xsim* xvlog*
