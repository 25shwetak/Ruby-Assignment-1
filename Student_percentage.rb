class Result
    attr_accessor :name, :id, :marks
    @@id = 0
    @@names = []
    @@each_percentage = []
    def initialize(name,marks)
        @name = name
        @@id += 1
        @marks = marks
        @@names.push(name)
    end

    public
    def percentage
        sum = 0.0
        for i in 0..7 do
            sum += @marks[i]
        end
        per = sum/8
        puts per
        @@each_percentage.push(per)
    end

    def self.highest_percentage
        maxx = @@each_percentage[0]
        k = 0
        for i in 0..4 do
            if(@@each_percentage[i] >=  maxx)
                    maxx = @@each_percentage[i]
                    k = i
            end
        end
        p "Highest percentage is #{maxx} of student named #{@@names[k]}"
    end
end

for i in 0..4 do
    marks = []
    p "Enter name of #{i+1} student"
    name = gets

    p "Enter marks of student #{i+1}"
    for j in 0..7 do
        marks[j] = gets.to_i
    end

    obj = Result.new(name,marks)
    obj.percentage
end

Result.highest_percentage
