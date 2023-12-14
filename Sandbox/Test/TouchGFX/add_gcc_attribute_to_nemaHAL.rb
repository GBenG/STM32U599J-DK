# This script copies and modifies nema_hal.c as a gcc compatible file every time "Run Target" is selected in Designer

require 'fileutils'

FILE_NAME = "nema_hal.c"
SOURCE_PATH = "./Target/generated/"
TARGET_PATH = "../gcc/compatibility/"

FileUtils.mkdir(TARGET_PATH) unless File.exists? TARGET_PATH
targetFile=File.open(TARGET_PATH + FILE_NAME, 'w')
sourceFile=File.open(SOURCE_PATH + FILE_NAME)
sourceFile.each do |line|
  if line.include? "#pragma data_alignment = 8"
    #nothing
  elsif line.include? "static uint8_t nemagfx_pool_mem[NEMAGFX_BYTE_POOL_SIZE]; /* NemaGFX memory pool */"
    targetFile<<"static uint8_t nemagfx_pool_mem[NEMAGFX_BYTE_POOL_SIZE] __attribute__((aligned(8))); /* NemaGFX memory pool */\n"
  else
    targetFile<<line
  end
end
sourceFile.close
targetFile.close
