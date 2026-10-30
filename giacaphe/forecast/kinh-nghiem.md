# Sổ học kinh nghiệm dự đoán giá cà phê

Cập nhật: 30/10/2026 19:32. Sổ giữ 60 ngày mốc gần nhất; mọi con số đo trên giá THẬT đã về, không con số nào do mô hình ngôn ngữ viết. Sai số tính bằng đ/kg (nội địa) hoặc USD/tấn (thế giới).

Đây là sổ nội bộ để cải thiện mô hình — không phải khuyến nghị mua bán.

## Trung bình 4 tỉnh

Đã ghi 43 mốc dự đoán, 42 mốc đã có giá thật để chấm.

### Sai số theo tầm dự đoán

| Tầm (ngày) | Số lần | Sai số TB | Đứng yên | Dải 90% phủ |
|---|---|---|---|---|
| 1 | 36 | 296 đ | 628 đ | 100% |
| 2 | 34 | 700 đ | 703 đ | 94% |
| 3 | 33 | 808 đ | 939 đ | 91% |
| 4 | 32 | 1.062 đ | 1.028 đ | 84% |
| 5 | 32 | 966 đ | 1.025 đ | 94% |
| 6 | 32 | 955 đ | 1.203 đ | 97% |
| 7 | 34 | 1.286 đ | 1.397 đ | 88% |

### Ngày-1: mô hình so với đứng yên

Trên 42 lần đo: sai số TB **291 đ**, đứng yên **557 đ**, đúng chiều 74%, dải 90% phủ 100%.
→ Mô hình **đang thắng** mốc đứng yên (−266 đ).

### Từng lớp giúp hay hại (ngày-1)

| Lớp | Có tiếng nói | Đúng chiều | Nếu bỏ lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| truyền dẫn London | 34 | 88% | 561 đ | giúp (+270 đ) |
| tín hiệu sàn | 0 | — | 291 đ | chưa có tiếng nói |
| xu hướng gần | 0 | — | 291 đ | chưa có tiếng nói |
| AI điều tiết | 23 | 39% | 276 đ | hại (−15 đ) |

### Từng lớp AI riêng (ngày-1)

| Lớp AI | Có tiếng nói | Đúng chiều | Nếu bỏ riêng lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| tâm lý bản tin | 20 | 60% | 284 đ | hại (−7 đ) |
| đề xuất lệch sàn | 5 | 0% | 291 đ | không đổi |
| cung–cầu thế giới (GLM) | 25 | 40% | 285 đ | hại (−6 đ) |

### GLM theo đồng thuận kỹ thuật–tin

| Đồng thuận | Số lần | Sai số TB | Nếu bỏ GLM |
|---|---|---|---|
| kỹ thuật và tin cùng chiều | 18 | 406 đ | 393 đ |
| kỹ thuật và tin ngược chiều | 5 | 306 đ | 324 đ |
| không rõ | 2 | 143 đ | 90 đ |

Luật chốt trước: cần ≥ 20 mẫu "ngược chiều" (hiện 5) rồi mới xét hạ trọng số GLM ở nhóm đó.

### Phân loại lỗi ngày-1

- đúng chiều, vừa: 16 lần
- đúng chiều, quá tay: 6 lần
- đứng yên, đoán đứng yên: 6 lần
- đoán cú đi không xảy ra: 5 lần
- bỏ lỡ cú đi: 4 lần
- đúng chiều, non tay: 4 lần
- bỏ lỡ cú đi lớn: 1 lần

Tỷ lệ truyền dẫn thực (giá trong nước chép bao nhiêu phần cú đi của sàn London, trung vị trên 27 ngày sàn đi ≥ +0,50%): **0,51**.

### Hiệu chỉnh hệ số truyền dẫn (beta)

Đang dùng **beta 0,5** (mặc định 0,5). giữ 0,5: tốt nhất trên lưới là 0,5 (MAE 326 so với 326) nhưng chưa vượt ngưỡng cải thiện 3%.

| beta | Sai số TB nếu dùng |
|---|---|
| 0,3 | 393 đ |
| 0,4 | 344 đ |
| 0,5 | 326 đ |
| 0,6 | 382 đ |
| 0,7 | 461 đ |
| 0,8 | 555 đ |

### Năm lỗi lớn nhất và lý do

- **21/10/2026** (mốc 20/10/2026), sai 1.003 đ:
  - Đúng chiều, non tay: giá đi −2.000 đ, dự đoán −997 đ.
  - Lớp truyền dẫn London đúng chiều (−997 đ), bớt được 997 đ sai số.
  - Giá trong nước chép 1,00 lần cú đi −2,12% của sàn (hệ số truyền dẫn đang dùng 0,5).
- **02/10/2026** (mốc 01/10/2026), sai 841 đ:
  - Bỏ lỡ cú đi lớn: giá đi −800 đ, dự đoán +41 đ.
- **06/10/2026** (mốc 05/10/2026), sai 799 đ:
  - Đoán cú đi không xảy ra: giá đi 0 đ, dự đoán +799 đ.
  - Lớp truyền dẫn London kéo sai chiều (+799 đ), làm sai số tăng 799 đ.
- **12/10/2026** (mốc 10/10/2026), sai 743 đ:
  - Đoán cú đi không xảy ra: giá đi 0 đ, dự đoán −743 đ.
  - Lớp truyền dẫn London kéo sai chiều (−603 đ), làm sai số tăng 603 đ.
  - Sàn London đi thêm +1,30% sau lượt dự đoán — phần này lượt dự đoán chưa thể biết.
- **30/10/2026** (mốc 29/10/2026), sai 682 đ:
  - Đúng chiều, non tay: giá đi −1.000 đ, dự đoán −318 đ.
  - Lớp truyền dẫn London đúng chiều (−318 đ), bớt được 318 đ sai số.
  - Giá trong nước chép 1,57 lần cú đi −0,72% của sàn (hệ số truyền dẫn đang dùng 0,5).

## Các chuỗi khác — ngày-1

| Chuỗi | Số lần | Sai số TB | Đứng yên | Đúng chiều | Dải 90% phủ |
|---|---|---|---|---|---|
| Đắk Lắk | 42 | 287 đ | 557 đ | 74% | 100% |
| Lâm Đồng | 42 | 273 đ | 555 đ | 74% | 100% |
| Gia Lai | 42 | 290 đ | 560 đ | 74% | 100% |
| Đắk Nông | 42 | 295 đ | 562 đ | 71% | 100% |
| Robusta London | 37 | 41 USD | 43 USD | 51% | 95% |
| Arabica New York | 37 | 103 USD | 107 USD | 60% | 92% |

## Cách đọc

- **Đứng yên** là sai số nếu chỉ đoán "ngày mai bằng hôm nay" — mốc đối chứng khó thắng nhất. Mô hình phải thắng cột này mới đáng giữ.
- **Nếu bỏ lớp** là sai số trung bình khi trừ phần đóng góp của lớp đó ra khỏi dự đoán, tính trên đúng đầu vào đã ghi lúc dự đoán. Lớn hơn sai số thật nghĩa là lớp đó đang giúp.
- **Dải 90% phủ** là tỷ lệ ngày giá thật rơi trong dải thấp–cao mô hình vẽ. Mục tiêu ~90%: thấp hơn nhiều là dải đang hẹp hơn sự thật.
- Hiệu chỉnh beta theo luật chốt trước: cần ≥ 20 mẫu có truyền dẫn, beta mới phải giảm sai số ≥ 3% so với beta đang dùng, và chỉ chọn trong lưới 0,3, 0,4, 0,5, 0,6, 0,7, 0,8.
