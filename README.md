## Сборка

- Собрать сборочный образ:

      docker build --build-arg UID=`id -u` --build-arg GID=`id -g` -t buildbox:conan .

- Запуск и вход в сборочный контейнер:

      ./run_buildbox.sh

- Установка зависимостей

      ./install_depends.sh

- Сборка:

      cd _build
      cmake ..
      make


## Запуск

- Запуск:

      docker-compose up -d

- Завершение:

      docker-compose down
