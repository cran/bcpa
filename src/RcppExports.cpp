// This file was generated by Rcpp::compileAttributes
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

// GetL
double GetL(NumericVector x, NumericVector t, double rho, bool tau = false);
RcppExport SEXP bcpa_GetL(SEXP xSEXP, SEXP tSEXP, SEXP rhoSEXP, SEXP tauSEXP) {
BEGIN_RCPP
    SEXP __sexp_result;
    {
        Rcpp::RNGScope __rngScope;
        Rcpp::traits::input_parameter< NumericVector >::type x(xSEXP );
        Rcpp::traits::input_parameter< NumericVector >::type t(tSEXP );
        Rcpp::traits::input_parameter< double >::type rho(rhoSEXP );
        Rcpp::traits::input_parameter< bool >::type tau(tauSEXP );
        double __result = GetL(x, t, rho, tau);
        PROTECT(__sexp_result = Rcpp::wrap(__result));
    }
    UNPROTECT(1);
    return __sexp_result;
END_RCPP
}
