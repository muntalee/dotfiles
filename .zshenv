eval "$(zoxide init zsh)"

export GEM_HOME="$HOME/Programs/gems"

export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/usr/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:\
/Library/Frameworks/Python.framework/Versions/3.11/bin:\
/usr/local/texlive/2022basic/bin/universal-darwin:\
/opt/homebrew/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:\
/Users/munta/Programs/perlbrew/bin/:/usr/local/opt/openssl/bin:\
$HOME/.config/emacs/bin:$HOME/opt/homebrew/opt/texinfo/bin:\
/Users/munta/Library/Android/sdk/emulator:/opt/homebrew/opt/coreutils/\
libexec/gnubin:/opt/homebrew/opt/ruby/bin:$GEM_HOME/bin:\
/opt/homebrew/opt/curl/bin:$HOME/.local/bin:/bin:$HOME/.cargo/bin"

export ZSH="$HOME/.oh-my-zsh"
export MANPATH="/opt/local/share/man:/opt/local/Library/Frameworks/\
Python.framework/Versions/3.10/share/man:/usr/local/man:$MANPATH"

export PYTHONPATH="/opt/local/Library/Frameworks/Python.framework/\
Versions/3.10/lib/python3.10/site-packages:/opt/homebrew/lib/\
python3.10/site-packages:${PYTHONPATH}"

export PATH="$HOME/Programs/gems/bin:$PATH"

export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET"

export TERM=xterm-256color

# Flags
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib -L/opt/homebrew/opt/\
openssl@3/lib -L/opt/homebrew/opt/curl/lib -L/opt/homebrew/opt/llvm/lib \
-L/opt/homebrew/opt/llvm/lib/c++ -Wl,-rpath,/opt/homebrew/opt/\
llvm/lib/c++:$LDFLAGS"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include -I/opt/homebrew/opt/\
openssl@3/include -I/opt/homebrew/opt/curl/include -I/opt/homebrew/opt/\
llvm/include:$CPPFLAGS"

# Java related
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include:$CPPFLAGS"

# c/c++ related
export DYLD_LIBRARY_PATH="/opt/homebrew/Cellar/sdl2/2.28.5/lib:$DYLD_LIBRARY_PATH"
export DYLD_LIBRARY_PATH="/opt/homebrew/Cellar/sdl2_net/2.2.0/lib:$DYLD_LIBRARY_PATH"
export DYLD_LIBRARY_PATH="/opt/homebrew/Cellar/sdl2_ttf/2.20.2/lib:$DYLD_LIBRARY_PATH"
export DYLD_LIBRARY_PATH="/opt/homebrew/Cellar/sdl2_image/2.8.0/lib:$DYLD_LIBRARY_PATH"
export DYLD_LIBRARY_PATH="/opt/homebrew/Cellar/sdl2_mixer/2.6.3_1/lib:$DYLD_LIBRARY_PATH"
export DYLD_LIBRARY_PATH="/opt/homebrew/Cellar/sdl2_mixer/2.6.3_1/lib:$DYLD_LIBRARY_PATH"
export DYLD_LIBRARY_PATH="/opt/homebrew/Cellar/glew/2.2.0_1/lib:$DYLD_LIBRARY_PATH"
export DYLD_LIBRARY_PATH="/opt/homebrew/Cellar/glfw/3.3.9/lib:$DYLD_LIBRARY_PATH"
export DYLD_LIBRARY_PATH="/opt/homebrew/Cellar/glm/1.0.0/lib:$DYLD_LIBRARY_PATH"

export PATH="/opt/homebrew/sbin:$PATH"
export CPATH="/opt/homebrew/include:$CPATH"
export LIBRARY_PATH="/opt/homebrew/lib:$LIBRARY_PATH"
export LD_LIBRARY_PATH="/opt/homebrew/lib:$LD_LIBRARY_PATH"

#export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-1.8.jdk/Contents/Home"
export JAVA_HOME=$(/usr/libexec/java_home)

export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";

export VCPKG_ROOT="/Users/munta/dev/github/vcpkg"
export PATH=$VCPKG_ROOT:$PATH
