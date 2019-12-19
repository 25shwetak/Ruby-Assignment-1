puts "Enter the number"
x = gets.to_i
i=2
j=0
if x<=1
    puts "Not prime"
else
    while i < x do
        if (x % i ==0)
            j = 1
            break
            end
        i +=1
    end
    if j==0
        puts "Prime"
    else
        puts "Not prime"
    end
end
