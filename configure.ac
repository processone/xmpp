AC_PREREQ(2.59c)
AC_PACKAGE_VERSION(1.0.0)
AC_PACKAGE_NAME(xmpp)
AC_INIT(xmpp, 1.0.0, [], xmpp)

# Checks for programs.
AC_PROG_CC
AC_PROG_MAKE_SET

if test "x$GCC" = "xyes"; then
    CFLAGS="$CFLAGS -Wall"
fi

# Checks for typedefs, structures, and compiler characteristics.
AC_C_CONST

# Checks for library functions.
AC_FUNC_MALLOC
AC_HEADER_STDC

# Checks Erlang runtime and compiler
AC_ERLANG_NEED_ERL
AC_ERLANG_NEED_ERLC

# Checks and sets ERLANG_ROOT_DIR and ERLANG_LIB_DIR variable
# AC_ERLANG_SUBST_ROOT_DIR
# AC_ERLANG_SUBST_LIB_DIR

AC_ARG_ENABLE(gcov,
[AC_HELP_STRING([--enable-gcov], [compile with gcov enabled (default: no)])],
[case "${enableval}" in
  yes) gcov=true ;;
  no)  gcov=false ;;
  *) AC_MSG_ERROR(bad value ${enableval} for --enable-gcov) ;;
esac],[gcov=false])

AC_SUBST(gcov)

AC_CONFIG_FILES([vars.config])

AC_OUTPUT
