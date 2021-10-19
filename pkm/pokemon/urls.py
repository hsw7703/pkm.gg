from django.urls import path

from . import views

app_name = 'pokemon'

urlpatterns = [
    path('pokemon/', views.pokemonMainAPI, name='pokemon_main'),
    path('', views.pokemonMainAPI),
    path('pokemon/<int:pkm_id>/', views.pokemonDetailAPI, name='pokemon_detail'),
    path('held-items/', views.ItemMainAPI, name='held-items_main'),
    path('held-items/<int:id>/', views.ItemDetailAPI, name='held-items_detail'),
    path('battle-items/', views.BattleItemAPI, name='battle-items_main'),
    path('battle-items/<int:id>/', views.BattleItemDetailAPI, name='battle-items_detail'),
    path('news/', views.NewsMainAPI, name='news_main'),
    path('item-upgrade-cost/', views.ItemUpgradeCostAPI, name='item-upgrade-cost'),
    path('contact/', views.ContactPage),
    path('build/', views.build),
    path('build-list/<int:pkm_id>/', views.build_list)
]
