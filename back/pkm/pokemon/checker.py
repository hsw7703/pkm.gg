from django.core.exceptions import BadRequest
from .models import Battle_item

def build_checker(data):
    if len(data['item_id']) != 3:
        raise BadRequest('Invalid request.')
    if len(data['skill_id']) != 4:
        raise BadRequest('Invalid request.')

def battle_item_checker(id):
    try:
        return Battle_item.objects.get(id=id)
    except (KeyError, Battle_item.DoesNotExist):
        raise BadRequest('Invalid request.')
