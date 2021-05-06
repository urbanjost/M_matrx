program try_matz
use M_matrix, only : mat88, mat88_get, mat88_put
implicit none
integer,parameter :: lda=10
integer           :: m,n, i,j, ierr
doubleprecision   :: arr(lda,lda),x(lda,lda)
doubleprecision,allocatable   :: answer(:,:)
   call mat88( 'b=<1 2 3 4; 5 6 7 8>') ! create some values in mat88(3f)
   call mat88( 'a=magic(4)') ! create some values in mat88(3f)
   call mat88( 'c=3**3') ! create some values in mat88(3f)
   !call mat88( 2,'debug(1)') 
   ! The matrix ARR is generated by the program 
   m = 6
   n = 6
   arr = 0
   do j = 1, n
      do i = 1, n
         arr(i,j) = iabs(i-j)
      enddo   
   enddo   
   RUN: block
      ! The matrix ARR and sent to the stack by the first call to mat_MATZ.
      call mat88_put(arr,'ARR',0,ierr)
!      if (ierr .ne. 0) exit run
!      ! The call to mat88(1,'X=inv(A)') will invert our matrix, put the result
!      ! X on the stack and go back to our program.
!      call mat88(1,'X=inv(A)')
!      call mat88(1,'A')
      call mat88('who')
      call mat88()
      ! The second call to mat_MATZ will retrieve X .
      ierr=0
      call mat88_get(answer,'a',0,ierr); call checkit()
      call mat88_get(answer,'b',0,ierr); call checkit()
      call mat88_get(answer,'c',0,ierr); call checkit()
      call mat88_get(answer,'unknown',0,ierr); call checkit()
      ! The next call to mat88() will place you in interactive mode in mat88().
      ! Entering "return" will return back to the main program.
      call mat88()
   endblock RUN
   ! By the way, this matrix X is interesting. Take a look at round(2*(n-1)*X).
contains

subroutine checkit()
   if (ierr .ne. 0)then
      write(*,*)'<ERROR>',ierr
   else
      m=size(answer,dim=1)
      n=size(answer,dim=2)
      write(*,*)'<INFO>',new_line('A'),(( int(answer(i,j)),i=1,m),new_line('A'),j=1,n ),&
      & ' SIZE=',size(answer),'ROWS=',m,'COLS=',n,'IERR=',ierr
   endif
end subroutine checkit

end program try_matz
