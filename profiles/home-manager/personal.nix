{...}: {
  programs.git = {
    userEmail = "davejames@gmail.com";
    userName = "David James";
    signing = {
      key = "davejames@gmail.com";
      signByDefault = true;
    };
  };
}
