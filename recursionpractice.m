function out = recursionpractice()
    

    goob.a = [1,2,2,1];
    goob.b = [3,4];   
    goob.c = [5];
    
    %Nested For loop alternative: When you want to For loop over each
    %field of goob but you don't know how many fields goob has in advance
    
    function out = practice2(letter,goob)
        if letter <= length(fields(goob))
            gf = fields(goob);
            gf = gf(letter);
            gf = gf{1};
            
            for j=1:length(goob.(gf))
                listy = goob.(gf);
                gob = goob;
                gob.(gf) = listy(j);
                
                
                practice2(letter+1, gob)
                
                if letter == length(fields(goob))
                    disp('My goob is')
                    disp(gob)
                end
                
            end
        end
    end

    practice2(1, goob)

end