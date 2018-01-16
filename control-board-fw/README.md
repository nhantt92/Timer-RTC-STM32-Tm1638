# Thông số kỹ thuật bộ phát âm thanh đa ngôn ngữ

## Tính năng:
- Phát nhiều ngôn ngữ theo thư mục lựa chọn
- Khi mở nguồn mặc định sẽ phát ngôn ngữ tiếng việt
- Phím qua lại để chọn ngôn ngữ phát
- Phím tăng giảm để chỉnh volume

## Cấu trúc thư mục trong thẻ nhớ:
- Folder 01,02,03 .... tương ứng với từng ngôn ngữ
- File trong folder 001.mp3, 002.mp3, 003.mp3 .....

## Hoạt động:

- Mặc định sẽ chọn folder 01 và phát lặp lại file 001.mp3 trong folder đó
- Khi có tính hiệu enable kích ở mức thấp sẽ phát file 002.mp3, khi tín hiệu lên mức cao sẽ phát lại file 001.mp3. Khi tín hiệu enable kích tiếp theo sẽ phát file 003.mp3 và cứ thế tiếp tục

## Mô tả các hàm:

- dfReadFileCounts(&df1, DFPLAYER_DEVICE_SD); sẽ trả về số file trong thẻ nhớ, đọc giá trị ở biến df1->value
- dfReadFileCountsInFolder(&df1, 1); sẽ trả về số file trong folder, đọc giá trị ở biến df1->value
- dfVolume(&df1, 20); tăng giảm giá trị volume, hoặc có thể dùng hàm dfVolumeUp, dfVolumeDown
- dfPlayFolder(&df1, 1, 1); phát file trong folder
- dfLoop(&df1, 0); phát lặp lại
