HttpLab форк osmf
=================

Нужно заметить что этот репозиторий не содержит разрабатываемого нами плейера. Плейер находится в
репозитории git@github.com:httplab/MSPlayer.git и подключается к osmf через
submodules (будет лежать в директории player/MSPlayer)

# Репозиторий базового osmf
На самом деле не нужен, но на всякий случай:

`svn co http://svn.code.sf.net/adobe/osmf/svn/osmf/trunk osmf-svn`

# Клонирование

```bash
git clone git@github.com:httplab/osmf.git
git submodule init
git submodule update
```

# Подготовка

1. Установить AdobeFlashBuilder 4.6
2. Скачать flex4.5.1A и положить в `/Applications/Adobe Flash Builder 4.6/sdks/`
4. Засимлинкать `osmf/buildtools/sdks` -> `/Applications/Adobe Flash Builder 4.6/sdks/`
5. Возможно понадобится установить ant, ant-contrib, задать переменную окружения `$ANT_HOME`
6. Запустить `osmf/build.sh` для того, чтобы убедиться, что все собирается

```bash
build.sh clean # делает clean проекта
build.sh msplayer # собирает MSPlayer
build.sh player # собирает StrobeMediaPlayback
```

# Настройка AdobeFlashBuilder

1. Создать проект action script, не flex.
2. Путь к директории проекта `osmf/player/MSPlayer`
3. Название проекта MSPlayer
4. В визарде, который создает проект на этапе Build Paths во вкладке Library path
   в окне Build path libraries добавить:
   - `osmf/framework/OSMF/bin/OSMF.swc`
   - `osmf/player/MSPlayer/assets/assets.swc`
5. Создать проект.
6. Добавить sdk 4.5.1A и указать его в качестве используемого в проекте
6. In your project properties, under Adobe Flash Player options, select “Use a specific version” and choose 10.2.0.
7. Make sure the additional compiling arguments contain:

   ```-swf-version=11 -define CONFIG::LOGGING true -define CONFIG::FLASH_10_1 true -define CONFIG::PLATFORM
   true -define CONFIG::MOCK false```


Если все сделано правильно, то проект можно будет собрать в Flash Builder и запустить. В случае успешного
запуска в браузере откроется окошко, в котором плейер будет воспроизводить тестовое видео.


