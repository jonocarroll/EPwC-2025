function unique_count(data::Vector{Int32})::Int
    sorted_data = sort(data)
    count = 0
    if !isempty(sorted_data)
        count = 1
        for i in 2:length(sorted_data)
            if sorted_data[i] != sorted_data[i-1]
                count += 1
            end
        end
    end
    return count
end

function main()
    arr = Int32[1, 3, 1, 4, 1, 5]
    println(unique_count(arr))
end

main()