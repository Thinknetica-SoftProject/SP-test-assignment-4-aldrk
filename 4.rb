## Задача №4:
#
# В соседнем районе рождественские эльфы готовят подарки для жителей города.
# Для каждого подарка (файл data/4.txt) нужно найти сколько оберточной бумаги потребуется.
# Формула рассчета: 2*ш*д + 2*д*в + 2*в*ш + площадь наименьшей стороны
# Например, на подарок размером 2х3х4 требуется 2*6 + 2*12 + 2*8 = 52 + 6 кв. см.
#
# Сколько всего оберточной бумаги нужно купить эльфам?
#
## Требования к решению:
# - Входные данные находятся в файле data/4.txt
# - В значениях данные длины, ширины и высоты не упорядочены и могут идти в любом порядке, однако
# длина всегда наименьшее число из трех, высота - среднее, ширина - самое большое.
# - Результат должен быть выведен в консоль командой puts
#
#
## Решение:

content = File.new('./data/4.txt', "r:UTF-8").readlines

result = 0

def define_sides(str)
  str.split('x').map(&:to_i).sort!
end

def calc_square(length, width, height)
  2 * width * length + 2 * length * height + 2 * height * width + length * width
end

content.each do |c|
  sides = define_sides(c)

  result += calc_square(sides[0], sides[1], sides[2])
end

puts result
