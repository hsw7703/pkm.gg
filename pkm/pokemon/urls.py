from django.urls import path

from . import views

app_name = 'pokemon'

urlpatterns = [
    path('pokemon/', views.pokemonMainAPI),
    path('', views.pokemonMainAPI),
    path('pokemon/<int:pkm_id>/', views.pokemonDetailAPI),
    path('held-items/', views.ItemMainAPI),
    path('held-items/<int:id>/', views.ItemDetailAPI),
    path('battle-items/', views.BattleItemAPI),
    path('battle-items/<int:id>/', views.BattleItemDetailAPI),
    path('news/', views.NewsMainAPI),
    path('item-upgrade-cost/', views.ItemUpgradeCostAPI),
    path('contact/', views.ContactPage),
#    path('build/', views.build),
#    path('test/', views.pokemonMainTestAPI),
#    path('test_item/', views.buildTest),
#    path('news/<int:news_id>/', views.NewsDetailAPI),

    path('build/', views.build),
]
