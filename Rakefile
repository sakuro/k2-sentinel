# frozen_string_literal: true

require "json"
require "rake/clean"

info = JSON.parse(File.read("info.json"))
archive = "#{info["name"]}_#{info["version"]}.zip"

CLOBBER.include("#{info["name"]}_*.zip")

desc "Build release zip"
task build: archive

archive_sources = FileList[
  "LGPLv3.txt", "README.md", "changelog.txt", "info.json", "thumbnail.png",
  "**/*.lua", "locale/*/*.cfg", "graphics/**/*.png", "sounds/**/*.ogg"
].exclude("references/**/*")

file archive => archive_sources do
  prefix = archive.delete_suffix(".zip")
  sh "git archive --prefix #{prefix}/ HEAD -o #{archive}"
end

desc "Install MOD locally"
task install: archive do
  paths = JSON.parse(`bin/factorix path --json`)
  cp archive, paths["mod_dir"]
end

desc "Upload MOD to Factorio MOD Portal"
task release: archive do
  sh "bin/factorix mod upload #{archive} --category content --license default_gnulgplv3 --source-url https://github.com/sakuro/k2-sentinel"
end
