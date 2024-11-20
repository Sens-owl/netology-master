# netology-master
Kulikova Svetlana Viktorovna

Master-branch

my homeworks, snippets and additional code from work which is under Apache2 open license
# 1. Задание Git (Модуль CI/CD)
Задание 1:
[коммит 22ffb1f](https://github.com/Sens-owl/netology-master/commit/22ffb1f545f395d59eb422679bf06f8b81619961)

Задание 2:
[коммит 57fc48c](https://github.com/Sens-owl/netology-master/commit/57fc48cc5508fcd4d5065d281b748f7fc59d70c5)

Задание 3:
[коммит 82f0b20](https://github.com/Sens-owl/netology-master/commit/82f0b20be3f92612461ecfca9fa100f73c4d7464)
[схема веток](https://github.com/Sens-owl/netology-master/network) `дополнительно описана в чейнджлоге`

Пропустила добавление скрипта в мейн ветку. Но так в реальном CI/CD лучше не делать и в мастер ничего просто так не лить. Бест практис:
- Создать ветку main/master/prod, или любую другую, но она будет считаться релизной
- от этой ветки отделить dev/test или любую другую, и это предрелизная ветка
- от этой ветки делать уже feature, bugfix и т.д. Затем они сливаются в dev и тестируются, либо поставляются как unstable/pre-release/coming-feature ветки с нестабильным кодом (в зависимости от кода в репозитории)
- в случае успешного тестирования слить dev в prod, релиз отметить тегом с версией

Из своей практики: веду инфраструктурный репозиторий с кодом для Puppet, и там используется модель prod <- dev <- feature/bugfix
Инфраструктурные репозитории с кодом развертывания продуктов у нас принято вести: master <- feature/bugfix

Из интересного: по схеме Stable <- Unstable <- Featured работает NVidia и недавно я воспользовалась веткой Unstable, понадобились еще не аппрувнутые для Ubuntu Noble драйверы