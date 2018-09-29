```python
l=[10]
def main():
    l.append(30)
    print(l)
main()
print(l)
```

```python
l=[10]
def main():
    k=l+[3]
    l.append(30)
    print(l)
main()
print(l)
```
这样反而会报错：
```python
l=[10]
def main():
    l=l+[3]
    l.append(30)
    print(l)
main()
print(l)
```
