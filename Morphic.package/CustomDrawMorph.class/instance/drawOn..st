accessing
drawOn: c
^c translateBy: self position negated during: [:d|self drawBlock value: d]