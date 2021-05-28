program test_1
use M_matrix, only : laff, get_from_laff, put_into_laff
implicit none
integer,parameter :: lda=10
integer           :: m,n, i,j, ierr
doubleprecision   :: arr(lda,lda),x(lda,lda)
logical           :: logs=.false.
   !!logs=.true.
   !!call laff(2000,echo=.true.)
   call laff( 'display(ones(80,1)''*46)')
   call laff( 'display(''test_1'');clear;')
   if(logs)call laff( 'diary(''test_1.log'');')
   call laff( [ character(len=256) :: &
'// -----------------------------------------------------------------            ',&
'titles=[''GNP deflator''                                                          ',&
'        ''GNP         ''                                                          ',&
'        ''Unemployment''                                                          ',&
'        ''Armed Force ''                                                          ',&
'        ''Population  ''                                                          ',&
'        ''Year        ''                                                          ',&
'        ''Employment  ''];                                                        ',&
'// -----------------------------------------------------------------            ',&
'data = [                                                                        ',&
'    83.0  234.289  235.6  159.0  107.608  1947  60.323                          ',&
'    88.5  259.426  232.5  145.6  108.632  1948  61.122                          ',&
'    88.2  258.054  368.2  161.6  109.773  1949  60.171                          ',&
'    89.5  284.599  335.1  165.0  110.929  1950  61.187                          ',&
'    96.2  328.975  209.9  309.9  112.075  1951  63.221                          ',&
'    98.1  346.999  193.2  359.4  113.270  1952  63.639                          ',&
'    99.0  365.385  187.0  354.7  115.094  1953  64.989                          ',&
'   100.0  363.112  357.8  335.0  116.219  1954  63.761                          ',&
'   101.2  397.469  290.4  304.8  117.388  1955  66.019                          ',&
'   104.6  419.180  282.2  285.7  118.734  1956  67.857                          ',&
'   108.4  442.769  293.6  279.8  120.445  1957  68.169                          ',&
'   110.8  444.546  468.1  263.7  121.950  1958  66.513                          ',&
'   112.6  482.704  381.3  255.2  123.366  1959  68.655                          ',&
'   114.2  502.601  393.1  251.4  125.368  1960  69.564                          ',&
'   115.7  518.173  480.6  257.2  127.852  1961  69.331                          ',&
'   116.9  554.894  400.7  282.7  130.081  1962  70.551                          ',&
'   ];                                                                           ',&
'// -----------------------------------------------------------------            ',&
'short                                                                           ',&
'X = data;                                                                       ',&
'[n,p] = shape(X)                                                                 ',&
'mu = ones(1,n)*X/n                                                              ',&
'X = X - ones(n,1)*mu;  X = X/diag(sqrt(diag(X''*X)))                            ',&
'corr = X''*X                                                                    ',&
'y = data(:,p); X = [ones(y) data(:,1:p-1)];                                     ',&
'long e                                                                          ',&
'beta = X\y                                                                      ',&
'// -----------------------------------------------------------------            ',&
'display(''EXPECTED and BETA should be the same'');                                ',&
'eps                                                                             ',&
'expected = [ ...                                                                ',&
'        -3.482258634594421D+03                                                  ',&
'         1.506187227124484D-02                                                  ',&
'        -3.581917929257409D-02                                                  ',&
'        -2.020229803816908D-02                                                  ',&
'        -1.033226867173703D-02                                                  ',&
'        -5.110410565317738D-02                                                  ',&
'         1.829151464612817D+00                                                  ',&
'];                                                                              ',&
'delta=expected-beta                                                             ',&
'<M,N>=shape(expected);                                                           ',&
'for i=1:M, for j=1:N, if abs(delta(i,j))<=eps, delta(i,j)=0; else, delta(i,j)=-1;',&
'delta                                                                           ',&
'if delta=zeros(M,N),display(''PASSED''),else,display(''FAILED'')                    ',&
'// -----------------------------------------------------------------            ',&
''])
end program test_1
