V=[400,400];
Matrix1=zeros(V);
Matrix2=zeros(V);
Matrix3=zeros(V);
Val=[50,100,80];
f=0.5;
ind=1e6;
%Computo la forma en que se añade elemento
AddFlow1 = AddFlow(Matrix1,[70,220],Val(1),1000,f);
AddFlow2 = AddFlow(Matrix2,[330,220],Val(2),1000,f);
AddFlow3 = AddFlow(Matrix3,[90,130],Val(3),1000,f);
for n = 1:1500
      %Matrices de objetos M1 y M2 de elementos 1 y 2 correspondientes 
      %evolucionan "como el agua" - la esencia elemental fluye de mayor 
      %densidad a menor densidad. 
      Matrix1 = max(Matrix1,min(Val(1),Matrix1 + AddFlow1)) + f*del2(Matrix1,1);
      Matrix2 = max(Matrix2,min(Val(2),Matrix2 + AddFlow2)) + f*del2(Matrix2,1);
      Matrix3 = max(Matrix3,min(Val(3),Matrix3 + AddFlow3)) + f*del2(Matrix3,1);
end
%Matriz de densidad mágica del elemento 1 debido a el contexto
%ofrecido por el elemento 2,3. Flujos elementales opuestos
%generan magia positiva.
%Y flujos de elementos diferentes opuestos aún más
MatrixD = ind*del2(Matrix1,1).*(del2(Matrix2,1)+del2(Matrix3,1));


p1 = surf(MatrixD);
hold on
p2 = surf(Matrix1);
p3 = surf(Matrix2);
p4 = surf(Matrix3);
p5 = surf(AddFlow1);
set(p1,'FaceColor',[1 0 0],'FaceAlpha',0.5);
set(p2,'FaceColor',[0 1 0],'FaceAlpha',0.5);
set(p3,'FaceColor',[0 0 1],'FaceAlpha',0.5);
set(p4,'FaceColor',[1 1 0],'FaceAlpha',0.5);
hold off