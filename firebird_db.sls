# just 32-bit x86 installer available

{% set SOURCE_PATH = 'https://github.com/FirebirdSQL/firebird/releases/download/R3_0_5/Firebird-3.0.5.33220_0_x64.exe' %}

{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}

{% set versions = [
                   '3.0.5',
] %}
{% set installers = [
                   'https://github.com/FirebirdSQL/firebird/releases/download/R3_0_5/Firebird-3.0.5.33220_0_x64.exe',
] %}

firebirddb:
{% for version in versions %}
  '{{ version }}':
    full_name: 'Firebird Db'
    installer: {{ installers[loop.index] }}
    # install_flags: '/S'
    install_flags: /VERYSILENT /NORESTART /SP- /NOCANCEL /SUPPRESSMSGBOXES
    uninstaller: '{{ PROGRAM_FILES }}\....'
    uninstall_flags: '/S'
    msiexec: False
    locale: de_DE
    reboot: False
{% endfor %}