function [mapp]=showimage(trainlabel,testlabel,Idxtrain,Idxtest,m,n)

  mapp = uint8(zeros(m*n,1));
 for i=1:size(Idxtrain,1);
     mapp(Idxtrain(i)) = trainlabel(i);
 end
  for i=1:size(Idxtest,1);
     mapp(Idxtest(i))=testlabel(i);
  end
     mapp = reshape(mapp,m,n);
   
