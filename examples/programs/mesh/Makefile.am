# Autoconf/Automake binaries and headers
#
#
bin_PROGRAMS=

if UCVM_AM_ENABLE_CVMH
bin_PROGRAMS += run_ucvm2mesh_cvmh.sh
run_ucvm2mesh_cvmh_sh_SOURCES = run_ucvm2mesh_cvmh.sh

if UCVM_HAVE_MPI
bin_PROGRAMS += run_ucvm2mesh_mpi_cvmh.sh
run_ucvm2mesh_mpi_cvmh_sh_SOURCES = run_ucvm2mesh_mpi_cvmh.sh
endif 

endif

if UCVM_HAVE_MPI

if UCVM_AM_ENABLE_CVMSI
bin_PROGRAMS += run_ucvm2mesh_mpi_cvmsi.sh
run_ucvm2mesh_mpi_cvmsi_sh_SOURCES = run_ucvm2mesh_mpi_cvmsi.sh

bin_PROGRAMS += run_ucvm2mesh_mpi_layer_cvmsi.sh
run_ucvm2mesh_mpi_layer_cvmsi_sh_SOURCES = run_ucvm2mesh_mpi_layer_cvmsi.sh
endif

if UCVM_AM_ENABLE_CVMS
bin_PROGRAMS += run_ucvm2mesh_mpi_layer_cvms.sh
run_ucvm2mesh_mpi_layer_cvms_sh_SOURCES = run_ucvm2mesh_mpi_layer_cvms.sh
endif

endif #MPI


all: $(bin_PROGRAMS)

############################################
# Special build targets
############################################
check: $(bin_PROGRAMS)
	@( cd ${prefix}/tests/mesh; \
	for i in $(bin_PROGRAMS); do \
		./$${i}; \
	done \
	)

install: $(bin_PROGRAMS)
	mkdir -p ${prefix}/tests/mesh
	cp *_template ${prefix}/tests/mesh
	for i in $(bin_PROGRAMS); do \
		cp $${i} ${prefix}/tests/mesh; \
		echo "(cd mesh; ./$${i})" >> ${prefix}/tests/run-testing; \
	done

clean: 
	rm -f *.o *~ *.conf *.grid *.media ucvm2mesh_mpi*


