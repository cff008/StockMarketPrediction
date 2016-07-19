j = 0;
r = 0;
def = 0;
corr = 0;
corr2 = 0;
for k = 1:10
    ih = [900*k - 899: 900*k];
    it = setdiff(1:9000,ih);
    
    Xt = A(it,:);
    yt = b(it,:);
    
    svmModel = svmtrain(Xt, yt, 'Kernel_Function','rbf','RBF_Sigma',1);
    
    Xhold = A(ih,:);
    Yhold = b(ih,:);
    pred = svmclassify(svmModel, Xhold, 'Showplot',false);
    e = 0;
    i = 900;
    for t = 1:i
        if(pred(t) == 1)
            corr = corr + 1;
        end
        if(pred(t) == Yhold(t))
            
        else
            e = e + 1;
            if(pred(t)== 1 && Yhold(t)==-1)
                r = r + 1;
            end
        end
    end
    corr = corr/900;
    corr2 = corr2 + corr;
    r = r/900;
    def = def + r;
    e = e/900; 
    j = j + e;
end
defrate = def/10;
errorrate = j/10;
corrrate = corr2/10;

