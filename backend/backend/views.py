from django.http import JsonResponse

def get_file_content(path):
    content = ''
    with open(path, 'r') as file:
        content = file.read().replace('\n', '')
    return content

def index(request):
    color = get_file_content('COLOR')
    version = get_file_content('VERSION')

    return JsonResponse({'color': color, 'version': version})
