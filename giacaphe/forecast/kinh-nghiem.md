# Sổ học kinh nghiệm dự đoán giá cà phê

Cập nhật: 15/09/2026 07:54. Sổ giữ 60 ngày mốc gần nhất; mọi con số đo trên giá THẬT đã về, không con số nào do mô hình ngôn ngữ viết. Sai số tính bằng đ/kg (nội địa) hoặc USD/tấn (thế giới).

Đây là sổ nội bộ để cải thiện mô hình — không phải khuyến nghị mua bán.

## Trung bình 4 tỉnh

Đã ghi 2 mốc dự đoán, 1 mốc đã có giá thật để chấm.

### Sai số theo tầm dự đoán

| Tầm (ngày) | Số lần | Sai số TB | Đứng yên | Dải 90% phủ |
|---|---|---|---|---|
| 1 | 1 | 22 đ | 0 đ | 100% |

### Ngày-1: mô hình so với đứng yên

Trên 1 lần đo: sai số TB **22 đ**, đứng yên **0 đ**, đúng chiều 0%, dải 90% phủ 100%.
→ Mô hình **đang thua** mốc đứng yên (+22 đ).

### Từng lớp giúp hay hại (ngày-1)

| Lớp | Có tiếng nói | Đúng chiều | Nếu bỏ lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| truyền dẫn London | 1 | 0% | 114 đ | giúp (+92 đ) |
| tín hiệu sàn | 0 | — | 22 đ | chưa có tiếng nói |
| xu hướng gần | 0 | — | 22 đ | chưa có tiếng nói |
| AI điều tiết | 1 | 0% | 137 đ | giúp (+115 đ) |

### Từng lớp AI riêng (ngày-1)

| Lớp AI | Có tiếng nói | Đúng chiều | Nếu bỏ riêng lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| tâm lý bản tin | 1 | 0% | 60 đ | giúp (+38 đ) |
| đề xuất lệch sàn | 0 | — | 22 đ | chưa có tiếng nói |
| cung–cầu thế giới (GLM) | 1 | 0% | 98 đ | giúp (+76 đ) |

### GLM theo đồng thuận kỹ thuật–tin

| Đồng thuận | Số lần | Sai số TB | Nếu bỏ GLM |
|---|---|---|---|
| không rõ | 1 | 22 đ | 98 đ |

Luật chốt trước: cần ≥ 20 mẫu "ngược chiều" (hiện 0) rồi mới xét hạ trọng số GLM ở nhóm đó.

### Phân loại lỗi ngày-1

- đứng yên, đoán đứng yên: 1 lần

### Hiệu chỉnh hệ số truyền dẫn (beta)

Đang dùng **beta 0,5** (mặc định 0,5). chưa đủ mẫu (1/20) — dùng beta mặc định 0,5.

| beta | Sai số TB nếu dùng |
|---|---|
| 0,3 | 0 đ |
| 0,4 | 0 đ |
| 0,5 | 22 đ |
| 0,6 | 49 đ |
| 0,7 | 76 đ |
| 0,8 | 104 đ |

### Năm lỗi lớn nhất và lý do

- **15/09/2026** (mốc 14/09/2026), sai 22 đ:
  - Đứng yên, đoán đứng yên: giá đi 0 đ, dự đoán +22 đ.

## Các chuỗi khác — ngày-1

| Chuỗi | Số lần | Sai số TB | Đứng yên | Đúng chiều | Dải 90% phủ |
|---|---|---|---|---|---|
| Đắk Lắk | 1 | 20 đ | 0 đ | 0% | 100% |
| Lâm Đồng | 1 | 22 đ | 0 đ | 0% | 100% |
| Gia Lai | 1 | 20 đ | 0 đ | 0% | 100% |
| Đắk Nông | 1 | 25 đ | 0 đ | 0% | 100% |
| Robusta London | 0 | — | — | — | — |
| Arabica New York | 0 | — | — | — | — |

## Cách đọc

- **Đứng yên** là sai số nếu chỉ đoán "ngày mai bằng hôm nay" — mốc đối chứng khó thắng nhất. Mô hình phải thắng cột này mới đáng giữ.
- **Nếu bỏ lớp** là sai số trung bình khi trừ phần đóng góp của lớp đó ra khỏi dự đoán, tính trên đúng đầu vào đã ghi lúc dự đoán. Lớn hơn sai số thật nghĩa là lớp đó đang giúp.
- **Dải 90% phủ** là tỷ lệ ngày giá thật rơi trong dải thấp–cao mô hình vẽ. Mục tiêu ~90%: thấp hơn nhiều là dải đang hẹp hơn sự thật.
- Hiệu chỉnh beta theo luật chốt trước: cần ≥ 20 mẫu có truyền dẫn, beta mới phải giảm sai số ≥ 3% so với beta đang dùng, và chỉ chọn trong lưới 0,3, 0,4, 0,5, 0,6, 0,7, 0,8.
