# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}

{% set versions = [
                   '@TODO',
] %}

medicaloffice:
{% for version in versions %}
  '{{ version }}':
    full_name: 'Medical Office'
    installer: '@TODO'
    # install_flags: '/S'
    install_flags: /VERYSILENT /NORESTART /SP- /NOCANCEL /SUPPRESSMSGBOXES
    uninstaller: '{{ PROGRAM_FILES }}\....'
    uninstall_flags: '/S'
    msiexec: False
    locale: de_DE
    reboot: False
{% endfor %}