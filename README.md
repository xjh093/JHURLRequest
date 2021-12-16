# JHURLRequest
extension URLRequest

---

# Example

```
func test1() {
    let url = "https://httpbin.org/get"
    let dic: [String: Any] = [
        "name": "Lilei",
        "age": 18,
        "gender": "male",
        "height": 1.80,
        "happy": true
    ]
    let req = URLRequest.jh_request(url, params: dic)

    URLSession.shared.dataTask(with: req!) { (data, response, error) in
        guard let data = data else {
            print("data is nil")
            return
        }

        guard let dict = try? JSONSerialization.jsonObject(with: data, options: []) else {
            print("data to dict failed!")
            return
        }
        
        print("response data = ", dict)
    }.resume()
}
```
