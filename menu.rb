def read_alum(file_name)
file = File.open(file_name, 'r')
alum = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
file.close
alum
end
print read_alum('nombres.csv')

def menu
  puts"\n -------------------------------
1) Mostrar alumnos y sus promedios
2) Mostrar alumnos con sus inasistencias
3) Mostrar alumnos reprobados
4) Salir"
end

menu
puts 'Ingrese una opcion'
opcion = gets.chomp.to_i

while opcion != 4
  if opcion == 1
    puts '1'
  elsif opcion == 2
    puts '2'
  elsif opcion == 3
    puts '3'
  else
    puts 'Ingrese una opcion válida'
  end
  menu
  puts 'Ingrese una opcion'
  opcion = gets.to_i

end
