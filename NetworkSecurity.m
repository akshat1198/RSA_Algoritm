    %% Fermat's Primality Test for p
r1 = 0;
r2 = 0;

while (r1 ~= 1) % %implements Fermat's Primality Test for p until p is prime
    p = randi(50); % generates a random prime less than 100
    y = 1;
    k = mod(power(2,1), p);

    while y < (p - 1)/2
        k = mod(power(k,2), p);
        y = 2 * y;      
    end

    z = (p-1) - y;
    r1 = mod(k*2^z,p);
end 
        
    %% Fermat's Primality Test for q

while (r2 ~= 1) %implements Fermat's Primality Test for q until q is prime
   q = randi(p-1);
   y = 1;
   k = mod(power(2,1), q);

   while y < (q - 1)/2
       k = mod(power(k,2), q);
       y = 2 * y;      
   end

   z = (q-1) - y;
   r2 = mod(k*2^z,q);
end    



phi=(p-1)*(q-1);
n=p*q
e=[];

digits2 = 2:phi;
%%
% 
% 
% 
    for i=2:length(digits2)
        if gcd(digits2(i),phi)==1
            e(length(e)+1)= digits2(i);
        end
    end
%end


z=randperm(length(e),1);
e1=e(z) %randomly selected from the e array 


g= gcd(e1,phi);
fprintf('The gcd is %i\n', g)
[a,b,c] = gcd(e1,phi) % a=e, b=d, c=a number that doesnt matter

prompt = 'Enter a plaintext: ';
str = input(prompt,'s')

m= double(str)

q= powermod(m,e1,n)
Alphabet = 'abcdefghijklmnopqrstuvwxyz';
number = mod(q,25);
cipher= Alphabet(number)


j=25;

f = [];
   while (j(end) ~= 0)
       f = [f floor(n(end)/j(end))];
       n = [n j(end)];
       j = [j mod(n(end-1), j(end))];
   end
               
   % updates
         j = j(1:(end));
       
         d = n(1:(end-1));
         a = 1;
         b = 0;
         
         
         % print steps
         numberOfSteps = numel(f) - 1;
         
         fprintf ('Euclidean algorithm. Forward process.\n\n');
         for i = 1:numberOfSteps+1
             fprintf('%d = %d * %d + %d \n', d(i), f(i), j(i), j(i+1));
         end
         
         fprintf ('\n\n');
         
%DECRYPTION


            xx = 0;
            yy = 1;
           
        % print steps
        numberOfSteps = numel(f) - 1;
        fprintf ('Switching the equations.\n\n');
        step = 1;
       
        for i = (numberOfSteps):-1:1
            fprintf('%d = %d - (%d * %d)\n', j(i+1), d(i), f(i), j(i));
           
            if (mod(step, 2) ~= 0)                
                xx = xx + yy * f(i);
            else
                yy = yy + xx * f(i);
            end
           
            step = step + 1;
        end     
       
        xx = xx * (-1);
       
        fprintf('\n\nAnswer:\n');
        if (gcd(d(1),j(1)) == (xx * d(1) + yy * j(1)))
        fprintf('(%d) * %d + (%d) * %d = %d \n', xx, d(1), yy, j(1), (xx * d(1) + yy * j(1)) );
        else
        fprintf('(%d) * %d + (%d) * %d = %d \n', yy, d(1), xx, j(1), (yy * d(1) + xx * j(1)) );
        end
d(1)
n(1)
%asd = mod(e1^(-1),phi);
m2 = double(cipher)
dec = powermod(m2,d(1),n(1))
number2 = mod(dec,25);
text = Alphabet(number2)

