function ResultMatrix = AddFlow(M,Pos,Val,m,f)
AddMatrix=zeros(size(M));
AddMatrix(Pos(2),Pos(1))=Val;
for n = 1:m
    AddMatrix = AddMatrix + f*del2(AddMatrix,1);
end
ResultMatrix = max(M,min(Val,M + AddMatrix));
end