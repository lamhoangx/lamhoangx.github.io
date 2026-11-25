# Sổ học kinh nghiệm dự đoán giá cà phê

Cập nhật: 26/11/2026 06:15. Sổ giữ 60 ngày mốc gần nhất; mọi con số đo trên giá THẬT đã về, không con số nào do mô hình ngôn ngữ viết. Sai số tính bằng đ/kg (nội địa) hoặc USD/tấn (thế giới).

Đây là sổ nội bộ để cải thiện mô hình — không phải khuyến nghị mua bán.

## Trung bình 4 tỉnh

Đã ghi 3 mốc dự đoán, 2 mốc đã có giá thật để chấm.

### Sai số theo tầm dự đoán

| Tầm (ngày) | Số lần | Sai số TB | Đứng yên | Dải 90% phủ |
|---|---|---|---|---|
| 1 | 2 | 376 đ | 800 đ | 100% |
| 2 | 1 | 642 đ | 1.600 đ | 100% |

### Lớp xu hướng chậm (ngày 2–7)

Từ `tv-close-gemini-v12` các ngày 2–7 cộng thêm 0,5 × mức đổi trung bình mỗi ngày trên 20 phiên của chính chuỗi giá (từ `tv-close-gemini-v13`: 0,25 khi chuỗi vừa qua phiên sốc). Trên 1 mốc lớp có lên tiếng (1 lần chấm ngày 2–7): sai số TB **642 đ**, nếu bỏ lớp **806 đ**.
Luật chốt trước: cần ≥ 20 mốc đã chấm (hiện 1) rồi mới kết luận.

### Ngày-1: mô hình so với đứng yên

Trên 2 lần đo: sai số TB **376 đ**, đứng yên **800 đ**, đúng chiều 100%, dải 90% phủ 100%.
→ Mô hình **đang thắng** mốc đứng yên (−424 đ).

### Từng lớp giúp hay hại (ngày-1)

| Lớp | Có tiếng nói | Đúng chiều | Nếu bỏ lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| truyền dẫn London | 2 | 100% | 800 đ | giúp (+424 đ) |
| dự đoán sàn London | 0 | — | 376 đ | chưa có tiếng nói |
| giá sàn đã chạy | 0 | — | 376 đ | chưa có tiếng nói |
| tín hiệu sàn | 0 | — | 376 đ | chưa có tiếng nói |
| xu hướng gần | 0 | — | 376 đ | chưa có tiếng nói |
| AI điều tiết | 0 | — | 376 đ | chưa có tiếng nói |
| xu hướng và mốc kỹ thuật từ nến | 0 | — | 376 đ | chưa có tiếng nói |
| cung cầu có dẫn nguồn | 0 | — | 376 đ | chưa có tiếng nói |
| các yếu tố thị trường đã qua kiểm định | 0 | — | 376 đ | chưa có tiếng nói |
| tỷ giá và thời tiết địa phương đã qua kiểm định | 0 | — | 376 đ | chưa có tiếng nói |

### Lớp đang đo BÓNG (chưa áp vào dự đoán)

**kỳ vọng của giới phân tích** — chỉ ĐO, dự đoán không dùng nhãn này; sổ tính "nếu áp thêm lớp này" bằng đúng hàm của bước ngày-1.
Trên 1 lần có nhãn (1 lần khác "đi ngang"): đúng chiều 0%; sai số TB thật **264 đ**, nếu áp thêm lớp này **307 đ**.
Luật chốt trước: cần ≥ 20 mẫu có nhãn khác "đi ngang" (hiện 1) rồi mới xét. Chưa đủ cơ sở để bàn đưa vào dự đoán.

### Lời đầu: dự đoán lúc giá vừa về, sàn London chưa có phiên mới

Từ `tv-close-gemini-v9` bản này lấy mức sàn DỰ ĐOÁN thay cho "đứng yên vì sàn chưa đi thêm". Trên 1 mốc: sai số TB **838 đ**, đoán đứng yên **1.000 đ**, đúng chiều 100%; lời cuối (sáng hôm sau, sàn đã đi thật) của chính các mốc đó **489 đ**.
Luật chốt trước: cần ≥ 20 mốc đã chấm (hiện 1) rồi mới kết luận.

### Phân loại lỗi ngày-1

- đúng chiều, vừa: 2 lần

Tỷ lệ truyền dẫn thực (giá trong nước chép bao nhiêu phần cú đi của sàn London, trung vị trên 2 ngày sàn đi ≥ +0,50%): **0,94**.

### Hiệu chỉnh hệ số truyền dẫn (beta)

Đang dùng **beta 0,5** (mặc định 0,5). giữ 0,5: tốt nhất trên lưới là 0,5 (MAE 512 so với 512) nhưng chưa vượt ngưỡng cải thiện 3%.

| beta | Sai số TB nếu dùng |
|---|---|
| 0,3 | 579 đ |
| 0,4 | 540 đ |
| 0,5 | 512 đ |
| 0,6 | 521 đ |
| 0,7 | 544 đ |
| 0,8 | 573 đ |

### Năm lỗi lớn nhất và lý do

- **25/11/2026** (mốc 24/11/2026), sai 489 đ:
  - Đúng chiều, vừa: giá đi −1.000 đ, dự đoán −511 đ.
  - Lớp truyền dẫn London đúng chiều (−511 đ), bớt được 511 đ sai số.
  - Giá trong nước chép 0,98 lần cú đi −1,44% của sàn (hệ số truyền dẫn đang dùng 0,5).
- **24/11/2026** (mốc 23/11/2026), sai 264 đ:
  - Đúng chiều, vừa: giá đi −600 đ, dự đoán −336 đ.
  - Lớp truyền dẫn London đúng chiều (−336 đ), bớt được 336 đ sai số.
  - Giá trong nước chép 0,89 lần cú đi −0,94% của sàn (hệ số truyền dẫn đang dùng 0,5).

## Các chuỗi khác — ngày-1

| Chuỗi | Số lần | Sai số TB | Đứng yên | Đúng chiều | Dải 90% phủ |
|---|---|---|---|---|---|
| Đắk Lắk | 2 | 377 đ | 800 đ | 100% | 100% |
| Lâm Đồng | 2 | 330 đ | 750 đ | 100% | 100% |
| Gia Lai | 2 | 377 đ | 800 đ | 100% | 100% |
| Đắk Nông | 2 | 326 đ | 750 đ | 100% | 100% |
| Robusta London | 3 | 0 USD | 28 USD | 100% | 100% |
| Arabica New York | 11 | 9 USD | 74 USD | 91% | 100% |

## Dự đoán sàn TRƯỚC PHIÊN (lời đầu của hai chuỗi sàn)

Bản dựng lúc bảng sàn vừa sang ngày, phiên tối nay chưa mở: chỉ có tín hiệu TradingView. Lời cuối (sáng hôm sau) lấy giá sàn đã chốt nên gần như đúng tuyệt đối — cột cuối để thấy phần chênh là thứ chỉ biết được khi phiên đã chạy.

| Chuỗi | Số mốc | Trước phiên: sai số TB | Đứng yên | Đúng chiều | Lời cuối |
|---|---|---|---|---|---|
| Robusta London | 2 | 24 USD | 28 USD | 100% | 0 USD |
| Arabica New York | 11 | 75 USD | 74 USD | 46% | 9 USD |

- Robusta London: luật chốt trước: cần ≥ 20 mốc đã chấm (hiện 2) rồi mới kết luận.
- Arabica New York: luật chốt trước: cần ≥ 20 mốc đã chấm (hiện 11) rồi mới kết luận.

## Cách đọc

- **Đứng yên** là sai số nếu chỉ đoán "ngày mai bằng hôm nay" — mốc đối chứng khó thắng nhất. Mô hình phải thắng cột này mới đáng giữ.
- **Nếu bỏ lớp** là sai số trung bình khi trừ phần đóng góp của lớp đó ra khỏi dự đoán, tính trên đúng đầu vào đã ghi lúc dự đoán. Lớn hơn sai số thật nghĩa là lớp đó đang giúp.
- **Dải 90% phủ** là tỷ lệ ngày giá thật rơi trong dải thấp–cao mô hình vẽ. Mục tiêu ~90%: thấp hơn nhiều là dải đang hẹp hơn sự thật.
- Hiệu chỉnh beta theo luật chốt trước: cần ≥ 20 mẫu có truyền dẫn, beta mới phải giảm sai số ≥ 3% so với beta đang dùng, và chỉ chọn trong lưới 0,3, 0,4, 0,5, 0,6, 0,7, 0,8.
