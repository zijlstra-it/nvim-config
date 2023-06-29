# Experimental
if ($IsWindows)
{
  $packages = @(
    "python",
    "lazygit",
    "fd",
    "bat",
    "make",
    "ripgrep",
    "neovim",
    "unzip",
    "mingw-nuwen"
  )

  # Check if Scoop is already installed
  if (Get-Command -Name 'scoop' -ErrorAction SilentlyContinue)
  {
    # If Scoop is already installed, display a message and add the main and extras buckets
    Write-Host "Scoop is already installed." -f White
    scoop bucket add main
    scoop bucket add extras
  } else
  {
    # If Scoop is not installed, display a message and install Scoop
    Write-Host "Installing Scoop..."
    # The following line is optional and only needed to run a remote script the first time
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser 
    Invoke-RestMethod get.scoop.sh | Invoke-Expression
    scoop bucket add main
    scoop bucket add extras
  }

  # Display a message and install the required packages
  Write-Host "Installing required packages..."
  foreach ($package in $packages)
  {
    scoop install $package
  }
}
