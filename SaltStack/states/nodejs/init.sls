nodejs_prereq:
  pkg.installed:
    - pkgs:
      - gcc-c++
      - make
  cmd.run:
    - name: "curl -sL https://rpm.nodesource.com/setup_11.x | sudo -E bash -"

nodejs:
  pkg.installed:
    - name: nodejs