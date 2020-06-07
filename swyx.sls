# just 32-bit x86 installer available
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}

{% set versions = [
                   '11.00.2821.0',
] %}
{% set installers = [
                   'https://www.swyx.com/download.php?filen=swyxit%21_v11.00_32bit_german.zip&loc=extern',
] %}

swyx:
{% for version in versions %}
  '{{ version }}':
    full_name: 'Swyx'
    installer: {{ installers[loop.index] }}
    # install_flags: '/S'
    install_flags: /VERYSILENT /NORESTART /SP- /NOCANCEL /SUPPRESSMSGBOXES
    uninstaller: '{{ PROGRAM_FILES }}\....'
    uninstall_flags: '/S'
    msiexec: False
    locale: de_DE
    reboot: False
{% endfor %}