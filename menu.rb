def read_alum(file_name)
file = File.open(file_name, 'r')
alum = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
file.close
alum
end
array = read_alum('nombres.csv')


def menu
  puts"\n -------------------------------
1) Mostrar alumnos y sus promedios
2) Mostrar alumnos con sus inasistencias
3) Mostrar alumnos aprobados
4) Salir"
end

menu
puts "\nIngrese una opcion"
opcion = gets.chomp.to_i

def aprobar(nombre, promedio, aprobacion = '5')
  if promedio.to_f >= aprobacion.to_f
    puts "\n #{nombre} aprobó con promedio #{promedio} :D "
  else
    puts "\n #{nombre} reprobó con promedio #{promedio} u.u "
  end
end

while opcion != 4

  if opcion == 1
    # Mostrar alumnos y sus promedios
    array.each do |i|
      nombre = i[0]
      notas = i[1..-1].map { |nota| nota.to_i  }
      promedio = notas.sum / notas.size.to_f
      puts "\n#{nombre} tiene un promedio de #{promedio}"
    end

  elsif opcion == 2
    # Mostrar alumnos con sus inasistencias
    array.each do |i|
      nombre = i[0]
      contador_inasistencias = i.count('A')

      if i.include? 'A'
        puts "\n#{nombre} tiene #{contador_inasistencias} inasistencia"
      else
        puts "\n#{nombre} no tiene inasistencias"
      end
    end

  elsif opcion == 3
    # Mostrar alumnos aprobados
    puts "\nPara aprobar debe tener un promedio mayor o igual a 5.0 \n\n"
    array.each do |i|
      nombre = i[0]
      notas = i[1..-1].map { |nota| nota.to_i  }
      promedio = notas.sum / notas.size.to_f
      aprobar(nombre, promedio, 5)
    end
  else
    puts 'Ingrese una opcion válida'
  end
  menu
  puts 'Ingrese una opcion'
  opcion = gets.to_i

end
