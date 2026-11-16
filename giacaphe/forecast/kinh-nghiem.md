# Sổ học kinh nghiệm dự đoán giá cà phê

Cập nhật: 17/11/2026 06:15. Sổ giữ 60 ngày mốc gần nhất; mọi con số đo trên giá THẬT đã về, không con số nào do mô hình ngôn ngữ viết. Sai số tính bằng đ/kg (nội địa) hoặc USD/tấn (thế giới).

Đây là sổ nội bộ để cải thiện mô hình — không phải khuyến nghị mua bán.

## Trung bình 4 tỉnh

Đã ghi 53 mốc dự đoán, 52 mốc đã có giá thật để chấm.

### Sai số theo tầm dự đoán

| Tầm (ngày) | Số lần | Sai số TB | Đứng yên | Dải 90% phủ |
|---|---|---|---|---|
| 1 | 43 | 333 đ | 598 đ | 98% |
| 2 | 42 | 769 đ | 760 đ | 93% |
| 3 | 42 | 921 đ | 1.026 đ | 93% |
| 4 | 41 | 1.219 đ | 1.205 đ | 85% |
| 5 | 40 | 1.194 đ | 1.272 đ | 90% |
| 6 | 40 | 1.271 đ | 1.440 đ | 92% |
| 7 | 43 | 1.500 đ | 1.605 đ | 86% |

### Ngày-1: mô hình so với đứng yên

Trên 52 lần đo: sai số TB **354 đ**, đứng yên **562 đ**, đúng chiều 69%, dải 90% phủ 98%.
→ Mô hình **đang thắng** mốc đứng yên (−208 đ).

### Từng lớp giúp hay hại (ngày-1)

| Lớp | Có tiếng nói | Đúng chiều | Nếu bỏ lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| truyền dẫn London | 42 | 81% | 556 đ | giúp (+202 đ) |
| dự đoán sàn London | 0 | — | 354 đ | chưa có tiếng nói |
| giá sàn đã chạy | 0 | — | 354 đ | chưa có tiếng nói |
| tín hiệu sàn | 0 | — | 354 đ | chưa có tiếng nói |
| xu hướng gần | 0 | — | 354 đ | chưa có tiếng nói |
| AI điều tiết | 25 | 44% | 352 đ | hại (−2 đ) |

### Từng lớp AI riêng (ngày-1)

| Lớp AI | Có tiếng nói | Đúng chiều | Nếu bỏ riêng lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| tâm lý bản tin | 19 | 58% | 350 đ | hại (−4 đ) |
| đề xuất lệch sàn | 4 | 0% | 353 đ | hại (−1 đ) |

### Lớp đang đo BÓNG (chưa áp vào dự đoán)

**kỳ vọng của giới phân tích** — chỉ ĐO, dự đoán không dùng nhãn này; sổ tính "nếu áp thêm lớp này" bằng đúng hàm của bước ngày-1.
Trên 2 lần có nhãn (2 lần khác "đi ngang"): đúng chiều 50%; sai số TB thật **244 đ**, nếu áp thêm lớp này **244 đ**.
Luật chốt trước: cần ≥ 20 mẫu có nhãn khác "đi ngang" (hiện 2) rồi mới xét. Chưa đủ cơ sở để bàn đưa vào dự đoán.

### Lời đầu: dự đoán lúc giá vừa về, sàn London chưa có phiên mới

Từ `tv-close-gemini-v9` bản này lấy mức sàn DỰ ĐOÁN thay cho "đứng yên vì sàn chưa đi thêm". Trên 1 mốc: sai số TB **78 đ**, đoán đứng yên **0 đ**, đúng chiều 0%; lời cuối (sáng hôm sau, sàn đã đi thật) của chính các mốc đó **179 đ**.
Luật chốt trước: cần ≥ 20 mốc đã chấm (hiện 1) rồi mới kết luận.

### Phân loại lỗi ngày-1

- đúng chiều, vừa: 17 lần
- đứng yên, đoán đứng yên: 8 lần
- đoán cú đi không xảy ra: 6 lần
- bỏ lỡ cú đi: 6 lần
- đúng chiều, non tay: 6 lần
- đúng chiều, quá tay: 5 lần
- bỏ lỡ cú đi lớn: 2 lần
- ngược chiều: 2 lần

Tỷ lệ truyền dẫn thực (giá trong nước chép bao nhiêu phần cú đi của sàn London, trung vị trên 32 ngày sàn đi ≥ +0,50%): **0,45**.

### Hiệu chỉnh hệ số truyền dẫn (beta)

Đang dùng **beta 0,5** (mặc định 0,5). giữ 0,5: tốt nhất trên lưới là 0,5 (MAE 388 so với 388) nhưng chưa vượt ngưỡng cải thiện 3%.

| beta | Sai số TB nếu dùng |
|---|---|
| 0,3 | 437 đ |
| 0,4 | 400 đ |
| 0,5 | 388 đ |
| 0,6 | 436 đ |
| 0,7 | 502 đ |
| 0,8 | 581 đ |

### Năm lỗi lớn nhất và lý do

- **03/11/2026** (mốc 02/11/2026), sai 1.654 đ:
  - Ngược chiều: giá đi −1.200 đ, dự đoán +454 đ.
  - Lớp truyền dẫn London kéo sai chiều (+492 đ), làm sai số tăng 492 đ.
  - Giá trong nước chép -1,22 lần cú đi +1,15% của sàn (hệ số truyền dẫn đang dùng 0,5).
- **16/11/2026** (mốc 14/11/2026), sai 1.075 đ:
  - Bỏ lỡ cú đi lớn: giá đi −1.000 đ, dự đoán +75 đ.
  - Lớp truyền dẫn London kéo sai chiều (+182 đ), làm sai số tăng 182 đ.
  - Mốc và ngày chấm cách nhau 2 ngày (nguồn nghỉ).
- **21/10/2026** (mốc 20/10/2026), sai 1.003 đ:
  - Đúng chiều, non tay: giá đi −2.000 đ, dự đoán −997 đ.
  - Lớp truyền dẫn London đúng chiều (−997 đ), bớt được 997 đ sai số.
  - Giá trong nước chép 1,00 lần cú đi −2,12% của sàn (hệ số truyền dẫn đang dùng 0,5).
- **31/10/2026** (mốc 30/10/2026), sai 999 đ:
  - Ngược chiều: giá đi −500 đ, dự đoán +499 đ.
  - Lớp truyền dẫn London kéo sai chiều (+578 đ), làm sai số tăng 578 đ.
  - Giá trong nước chép -0,43 lần cú đi +1,32% của sàn (hệ số truyền dẫn đang dùng 0,5).
- **02/10/2026** (mốc 01/10/2026), sai 841 đ:
  - Bỏ lỡ cú đi lớn: giá đi −800 đ, dự đoán +41 đ.

## Các chuỗi khác — ngày-1

| Chuỗi | Số lần | Sai số TB | Đứng yên | Đúng chiều | Dải 90% phủ |
|---|---|---|---|---|---|
| Đắk Lắk | 52 | 346 đ | 554 đ | 69% | 98% |
| Lâm Đồng | 52 | 343 đ | 563 đ | 69% | 98% |
| Gia Lai | 52 | 355 đ | 558 đ | 65% | 98% |
| Đắk Nông | 52 | 364 đ | 573 đ | 67% | 98% |
| Robusta London | 46 | 41 USD | 41 USD | 50% | 96% |
| Arabica New York | 46 | 107 USD | 109 USD | 61% | 94% |

## Dự đoán sàn TRƯỚC PHIÊN (lời đầu của hai chuỗi sàn)

Bản dựng lúc bảng sàn vừa sang ngày, phiên tối nay chưa mở: chỉ có tín hiệu TradingView. Lời cuối (sáng hôm sau) lấy giá sàn đã chốt nên gần như đúng tuyệt đối — cột cuối để thấy phần chênh là thứ chỉ biết được khi phiên đã chạy.

| Chuỗi | Số mốc | Trước phiên: sai số TB | Đứng yên | Đúng chiều | Lời cuối |
|---|---|---|---|---|---|
| Robusta London | 1 | 5 USD | 11 USD | 100% | 0 USD |
| Arabica New York | 1 | 16 USD | 23 USD | 100% | 0 USD |

- Robusta London: luật chốt trước: cần ≥ 20 mốc đã chấm (hiện 1) rồi mới kết luận.
- Arabica New York: luật chốt trước: cần ≥ 20 mốc đã chấm (hiện 1) rồi mới kết luận.

## Cách đọc

- **Đứng yên** là sai số nếu chỉ đoán "ngày mai bằng hôm nay" — mốc đối chứng khó thắng nhất. Mô hình phải thắng cột này mới đáng giữ.
- **Nếu bỏ lớp** là sai số trung bình khi trừ phần đóng góp của lớp đó ra khỏi dự đoán, tính trên đúng đầu vào đã ghi lúc dự đoán. Lớn hơn sai số thật nghĩa là lớp đó đang giúp.
- **Dải 90% phủ** là tỷ lệ ngày giá thật rơi trong dải thấp–cao mô hình vẽ. Mục tiêu ~90%: thấp hơn nhiều là dải đang hẹp hơn sự thật.
- Hiệu chỉnh beta theo luật chốt trước: cần ≥ 20 mẫu có truyền dẫn, beta mới phải giảm sai số ≥ 3% so với beta đang dùng, và chỉ chọn trong lưới 0,3, 0,4, 0,5, 0,6, 0,7, 0,8.
