var project = new Project('Zebrule');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addLibrary('zui');
project.windowOptions.width = 800;
project.windowOptions.height = 600;
return project;
