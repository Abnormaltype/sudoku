def sudoku(puzzle)
  9.times do |x|
    9.times do |y|
      next if puzzle[x][y] != 0

      n = [1,2,3,4,5,6,7,8,9] - puzzle[x] - puzzle.transpose[y] - puzzle.slice(x - x % 3, 3).transpose.slice(y - y % 3, 3).flatten
      next if n.size != 1

      puzzle[x][y] = n.first
      return sudoku(puzzle)
    end
  end
  puzzle.each do |line|
    puts "#{line}"
  end
  puzzle
end

sudoku([[5,3,0,0,7,0,0,0,0],
  [6,0,0,1,9,5,0,0,0],
  [0,9,8,0,0,0,0,6,0],
  [8,0,0,0,6,0,0,0,3],
  [4,0,0,8,0,3,0,0,1],
  [7,0,0,0,2,0,0,0,6],
  [0,6,0,0,0,0,2,8,0],
  [0,0,0,4,1,9,0,0,5],
  [0,0,0,0,8,0,0,7,9]])
