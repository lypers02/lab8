Type
  arra=array[1..8,1..8] of integer; 
Var 
  k,l,m,n,figure:integer;  
  color1,color2:integer;  
  r,g:Integer;
  f:Text;
  doska:arra;
//Процедура ввода исходных данных 
Procedure Enter;  
  label 
    m_1, m_2, m_3, m_4, m_5;                        
  Var     
    s:String;
    i:Integer;
  Begin                           
      m_1: Write('Введите k(от 1 до 8)=');     
      ReadLn(s);
      Val(s,k,i);  
      if i<>0  then  begin writeln ('Ошибка, повторите ввод!');writeln(f,'k = ',s,'  ','Oшибка, повторите ввод!'); goto m_1 end;         // Контроль ввода числа
      if (k>8) or (k<0) then begin writeln('Oшибка, повторите ввод!'); writeln(f,'k = ',s,'  ','Oшибка, повторите ввод!'); goto m_1; end;     // Контроль заданного интервала
      m_2: Write('Введите l(от 1 до 8)=');      
      ReadLn(s);
      Val(s,L,i);                         
      if i<>0  then  begin writeln ('Ошибка, повторите ввод!'); writeln(f,'l = ',s,'  ','Oшибка, повторите ввод!');goto m_2 end;         // Контроль ввода числа
      if (L>8) or (L<0) then begin writeln('Oшибка, повторите ввод!');writeln(f,'l = ',s,'  ','Oшибка, повторите ввод!'); goto m_2;end;      // Контроль заданного интервала
      m_3: Write('Введите m(от 1 до 8)=');
      Readln(s);     
      Val(s,m,i);                              
      if i<>0  then  begin writeln ('Ошибка, повторите ввод!'); writeln(f,'m = ','Oшибка, повторите ввод!');goto m_3 end;         // Контроль ввода числа
      if (m>8) or (m<0) then begin writeln('Oшибка, повторите ввод!');writeln(f,'m = ',s,'  ', 'Oшибка, повторите ввод!'); goto m_3;end;      // Контроль заданного интервала
      m_4: Write('Введите n(от 1 до 8)=');
      Readln(s);
      Val(s,n,i);                                             
      if i<>0  then  begin writeln ('Ошибка, повторите ввод!'); writeln(f,'n = ',s,'  ','Oшибка, повторите ввод!');goto m_4 end;         // Контроль ввода числа
      if (n>8) or (n<0) then begin writeln('Oшибка, повторите ввод!');writeln(f,'n = ',s,'  ','Oшибка, повторите ввод!'); goto m_4;end;      // Контроль заданного интервала
      m_5: Write('Введите номер фигуры(1-ферзь, 2-ладья, 3-слон,4-конь)=');
      Readln(s);
      Val(s,figure,i); 
      if i<>0  then  begin writeln ('Ошибка, повторите ввод!'); writeln(f,'figure = ',s,'  ','Oшибка, повторите ввод!');goto m_5 end;         // Контроль ввода числа
      if (figure>4) or (figure<0) then begin writeln('Oшибка, повторите ввод!'); writeln(f,'figure = ',s, '  ','Oшибка, повторите ввод!'); goto m_5;end;     // Контроль заданного интервала// Контроль ввода числа
    Writeln(f,'Введены числа k=',k,' l=',L,' m=',m,' n=',n,' и фигура=',figure); // Запись в файл введенной информации
  End;
// Процедура сравнения цветов полей (доска заполняется нулями и единицами) 
Procedure OneColor;                         
  Var 
    i,j:Byte;
  Begin
    For i:=1 To 8 Do 
      Begin
        For j:=1 To 8 Do 
          doska[i,j]:=(i+j) mod 2;           
      End;  
    color1:=doska[k,L];  
    color2:=doska[m,n];  
    If color1=color2 then 
      Begin 
        Writeln('Поля (', k, ',', l, ') и (',m, ',',n,') одинакового цвета');
        Writeln(f,'Поля (', k, ',', l, ') и (',m, ',',n,') одинакового цвета');
      End 
    Else Begin
        Writeln('Поля (', k, ',', l, ') и (',m, ',',n,') разного цвета');
        Writeln(f,'Поля (', k, ',', l, ') и (',m, ',',n,') разного цвета');
      End;  
  End;
//Процедура  ходов ферзя
Procedure ferz;                            
  Var 
    i,j,z,d,dx,dy:Integer;
    hod,hod2:arra;
    Fl:Boolean;
Begin  
//Заполнение всех полей на доске, куда может перейти ферзь одним ходом, единицами,
// а куда не может - нулями  
                                
      For i:=1 To 8 Do 
        Begin
          For j:=1 To 8 Do 
            Begin
              dx:=i-k; dy:=j-L;
              If (dx=dy) or (dx=-dy) or (i=k) or (j=L) Then hod[i,j]:=1 Else hod[i,j]:=0  
            End;
        End;      
      If hod[m,n]=1 Then 
        Begin 
          Writeln('На поле(',m,',',n,') c поля (', k, ',', l, ') можно перейти одним ходом ферзя' );
          Writeln(f,'На поле(',m,',',n,') c поля (', k, ',', l, ') можно перейти одним ходом ферзя' )
        End 
      Else                                // Поиск промежуточного хода
        Begin
          i:=1;                  
          j:=0;
          Repeat
            j:=j+1;                                
            Fl:=False;
            If j>8 Then 
              Begin 
                j:=1;
                i:=i+1;                           
              End;
            If hod[i,j]=1 Then Begin
                For z:=1 To 8 Do Begin
                    For d:=1 To 8 Do Begin
                        dx:=z-i; dy:=d-j;
                        If (dx=dy) or (dx=-dy) or (i=z) or (j=d) Then 
                           hod2[z,d]:=2 
                        Else 
                           hod2[i,j]:=0
                      End;  
                  End;      
                If hod2[m,n]=2 Then 
                  Begin 
                    r:=i;
                    g:=j;
                    Writeln('На поле(',m,',',n,') c поля (', k, ',', l, ') можно ферзем перейти через поле (', i, ',', j, ')' );
                    Writeln(f,'На поле(',m,',',n,') c поля (', k, ',', l, ') можно ферзем перейти через поле (', i, ',', j, ')' );
                    Fl:=True;
                  End
             end;
            If (i=8) and (j=8) Then Fl:=true;
          Until Fl;
        End;        
    end;
//Процедура  ходов ладьи    
Procedure Ladya;                                                    
  Var 
    i,j,z,d:Integer;
    hod,hod2:arra;
    Fl:Boolean;
  Begin  
//Заполнение всех полей на доске, куда может перейти ладья одним ходом, единицами,
// а куда не может - нулями  
    For i:=1 To 8 Do 
      Begin
        For j:=1 To 8 Do 
          If (i=k) or (j=L) Then hod[i,j]:=1 Else hod[i,j]:=0       
      End;      
    If hod[m,n]=1 Then 
      Begin 
        Writeln('На поле(',m,',',n,') c поля (', k, ',', l, ') можно перейти одним ходом ладьи' );
        Writeln(f,'На поле(',m,',',n,') c поля (', k, ',', l, ') можно перейти одним ходом ладьи' )
      End 
    Else                             // Поиск промежуточного хода
      Begin
        i:=1;
        j:=0;
        Repeat
          j:=j+1;
          Fl:=False;
          If j>8 Then 
            Begin 
              j:=1;
              i:=i+1;
            End;
          If hod[i,j]=1 Then 
            Begin
              For z:=1 To 8 Do 
                Begin
                  For d:=1 To 8 Do 
                    If (z=i) or (d=j) Then hod2[z,d]:=2 Else hod2[i,j]:=0 
                End;      
            If hod2[m,n]=2 Then 
               Begin
                 r:=i;
                 g:=j;                     
                 Writeln('На поле(',m,',',n,') c поля (', k, ',', l, ') можно ладьей перейти через поле (', i, ',', j, ')' );
                 Writeln(f,'На поле(',m,',',n,') c поля (', k, ',', l, ') можно ладьей перейти через поле (', i, ',', j, ')' );
                 Fl:=True;
               End
          end;
          If (i=8) and (j=8) Then Fl:=true;
        Until Fl;
    end;
  end;
//Процедура ходов слона  
Procedure Slon;
  Var 
    i,j,z,d,dx,dy:Integer;
    hod,hod2:arra;
    Fl:Boolean;
  Begin
//Заполнение всех полей на доске, куда может перейти слон одним ходом, единицами,
// а куда не может - нулями  
    If color1=color2 Then Begin    
      For i:=1 To 8 Do
        Begin
          For j:=1 To 8 Do 
            Begin
              dx:=i-k;
              dy:=j-L;
              If (dx=dy) or (dx=-dy) Then hod[i,j]:=1 Else hod[i,j]:=0 
            End;
        End;      
      If hod[m,n]=1 Then 
        Begin 
          Writeln('На поле(',m,',',n,') c поля (', k, ',', l, ') можно перейти одним ходом слона' );
          Writeln(f,'На поле(',m,',',n,') c поля (', k, ',', l, ') можно перейти одним ходом слона' )
        End 
      Else                                       // Поиск промежуточного хода
        Begin
          i:=1;
          j:=0;
          Repeat
            j:=j+1;
            Fl:=False;
            If j>8 Then 
              Begin 
                j:=1;
                i:=i+1;
              End;
            If hod[i,j]=1 Then 
              Begin
                For z:=1 To 8 Do 
                  Begin
                    For d:=1 To 8 Do 
                      Begin
                        dx:=z-i; 
                        dy:=d-j;
                        If (dx=dy) or (dx=-dy) Then 
                          hod2[z,d]:=2 
                        Else 
                          hod2[i,j]:=0
                      End;  
                  End;      
                If hod2[m,n]=2 Then
                  Begin 
                    r:=i;
                    g:=j;                    
                    Writeln('На поле(',m,',',n,') c поля (', k, ',', l, ') можно слоном перейти через поле (', i, ',', j, ')' );
                    Writeln(f,'На поле(',m,',',n,') c поля (', k, ',', l, ') можно слоном перейти через поле (', i, ',', j, ')' );
                    Fl:=True;
                  End
             end;
            If (i=8) and (j=8) Then Fl:=true;
          Until Fl;
        End; 
      End Else                                         //Отсутствие промежуточного хода в принципе
        Begin 
          Writeln('С поля(',m,',',n,') на поле (', k, ',', l, ') нельзя перейти ходом слона, так как эти поля разного цвета' );
          Writeln(f,'С поля(',m,',',n,') на поле (', k, ',', l, ') нельзя перейти ходом слона, так как эти поля разного цвета' );
        End;     
  end;
//Процедура ходов коня  
Procedure Kon;
  Var 
    i,j,z,d,dx,dy:Integer;
    hod,hod2:arra;
    Fl,FindHod,f1,f2:Boolean;
  Begin
//Заполнение всех полей на доске, куда может перейти конь одним ходом, единицами,
// а куда не может - нулями 
    For i:=1 To 8 Do 
      Begin
        For j:=1 To 8 Do Begin          
            dx:=i-k;
            dy:=j-L;
            If (Abs(dx)+Abs(dy)=3) and ((Abs(dx)=1) Or (Abs(dx)=2)) Then hod[i,j]:=1 Else hod[i,j]:=0 
          End;
      End;      
    If hod[m,n]=1 Then 
      Begin 
        Writeln('На поле(',m,',',n,') c поля (', k, ',', l, ') можно перейти одним ходом коня' );
        Writeln(f,'На поле(',m,',',n,') c поля (', k, ',', l, ') можно перейти одним ходом коня' )
      End 
    Else                                   // Поиск промежуточного хода
      Begin
        i:=1;
        j:=0;
        FindHod:=False;
        Repeat
          j:=j+1;
          Fl:=False;
          If j>8 Then 
            Begin 
              j:=1;
              i:=i+1;
            End;
          If hod[i,j]=1 Then 
            Begin
              For z:=1 To 8 Do 
                Begin
                  For d:=1 To 8 Do 
                    Begin
                      dx:=i-z;
                      dy:=j-d;
                      f1:=(Abs(dx)+Abs(dy)=3);
                      f2:=(Abs(dx)=1) Or (Abs(dx)=2);
                      If f1 and f2 Then hod2[z,d]:=2 Else hod2[i,j]:=0 
                    End;
                End;      
            If hod2[m,n]=2 Then 
               Begin 
                 r:=i;
                 g:=j;                    
                 Writeln('На поле(',m,',',n,') c поля (', k, ',', l, ') можно конем перейти через поле (', i, ',', j, ')' );
                 Writeln(f,'На поле(',m,',',n,') c поля (', k, ',', l, ') можно конем перейти через поле (', i, ',', j, ')' );
                 Fl:=True;
                 FindHod:=True;
               End
          end;
          If (i=8) and (j=8) Then Fl:=true;
        Until Fl; 
        If FindHod=False Then                          //Отсутствие промежуточного хода в принципе
          Begin 
            Writeln('На поле(',m,',',n,') c поля (', k, ',', l, ') нельзя перейти конем');
            Writeln(f,'На поле(',m,',',n,') c поля (', k, ',', l, ') нельзя перейти конем');
          End
      End;    
  end; 
//Процедура вывода на экран доски, положения фигуры и ходов: заданного (2) или промежуточного(1) и заданного (2)
Procedure Print;  
  Var 
    i,j:Integer;
  Begin
    For i:=8 DownTo 1 Do
      Begin
        Write(i,'  ');
        For j:=1 To 8 Do 
          begin
            If (i=L) and (j=k) Then                // Установка фигуры в заданное поле
              Case figure Of
                1:Write('Ф');
                2:Write('Л');
                3:Write('С');
                4:Write('К');
              end
            Else
              If (i=N) and (j=m) Then
               Write('2')                         // Обозначение заданного хода
              Else 
                If (i=g) and (j=r) Then        
                  Write('1')                      // Обозначение промежуточного хода, если он есть
                Else Write('0')                   // Заполнение остальных полей доски нулями
          end;
         Writeln; 
      End;
      Write('   ',12345678);
  end;
Begin
  Assign(f,'log.txt');                              // Связь файловой переменной именем внешнего файла 
  Append(f);                                        // Открытие внешнего файла
  writeln(f,String.Format('{0:d/M/yyyy HH:mm:ss}', DateTime.Now));
  r:=0;
  g:=0;      
  Enter;                                            // Вызов процедуры ввода данных
  Onecolor;                                         // Вызов процедуры сравнения цветов полей
  writeln(f,'Выбор обработки фигуры');
  Case figure of 
    1:Ferz;                                         //Вызов процедуры ходов ферзя
    2:Ladya;                                        //Вызов процедуры ходов ладьи
    3:Slon;                                         //Вызов процедуры ходов слона
    4:Kon;                                          //Вызов процедуры ходов коня
  end;
  print;                                            //Вызов процедуры вывода на экран
  Close(f);                                         //Закрытие внешнего файла
End.